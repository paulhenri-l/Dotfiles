class OneOffCommandInstaller
  def initialize(options = {})
    @config = YAML.load(File.open 'config/one_off_commands.yml')
    @ran_commands = File.expand_path('~/.config/dotfiles/ran_commands.yml')
    @already_ran_commands = YAML.load(File.open @ran_commands)
  end

  def install!
    @config['commands'].each { |c| run_command c }
  end

  private
  def run_command(command)
    unless command_already_ran command['name']
      system command['command']
      mark_command_as_ran command['name']
    end
  end

  def command_already_ran(command_name)
    @already_ran_commands.include? command_name
  end

  def mark_command_as_ran(command_name)
    file = File.open @ran_commands, 'a+'
    file.puts "- '#{command_name}'\n"
    file.close
  end
end
