require_relative './abstract_program_installer'

class ZshInstaller < AbstractProgramInstaller
  def initialize(options = {})
    super options
    @oh_my_zsh_dir = File.expand_path '~/.oh-my-zsh'
  end

  def install!
    if bin_exists? 'zsh'
      change_shell
      install_oh_my_zsh
      source_zshrc_extension
    else
      puts 'ZSH is not installed. Skipping OhMyZsh'
    end
  end

  private
  def change_shell
    unless ENV['SHELL'].include? 'zsh'
      system 'chsh -s $(which zsh)'
    end
  end

  def install_oh_my_zsh
    if Dir.exists?(@oh_my_zsh_dir)
      system "cd #{@oh_my_zsh_dir} && git pull"
    else
      system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    end
  end

  def source_zshrc_extension
    owner_zshrc = File.open(File.expand_path('~/.zshrc'), 'a+')
    zshrc_extension = File.absolute_path('files/zshrc_extension')
    installed = owner_zshrc.each_line.any? { |l| l.include? zshrc_extension }

    unless installed
      owner_zshrc.puts ''
      owner_zshrc.puts '# Sourcing Dotfiles zshrc extension'
      owner_zshrc.puts "source #{File.absolute_path('files/zshrc_extension')}"
    end
  end
end
