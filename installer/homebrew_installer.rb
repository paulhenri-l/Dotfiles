require_relative './abstract_program_installer'

class HomeBrewInstaller < AbstractProgramInstaller
  def initialize(options = {})
    super options
    @config = YAML.load(File.open './config/homebrew_installer.yml')
  end

  def install!
    install_homebrew
    @config['taps'].each { |t| add_tap t }
    @config['packages'].each { |p| install_package p }
  end

  private
  def install_homebrew
    if bin_exists? 'brew'
      system 'brew update'
    else
      system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
  end

  def add_tap(tap)
    system "brew tap #{tap}" unless tap_exists? tap
  end

  def install_package(package)
    if should_install? package
      system("brew install #{package['name']}")
      run_post_install_command package['post_command'] if package.include? 'post_command'
    end
  end

  def run_post_install_command(command)
    system(command)
  end 

  def tap_exists?(tap)
    @existing_taps = @existing_taps || %x(brew tap)

    @existing_taps.include? tap
  end

  def should_install?(package)
    if package.include? 'custom_check' 
      return !system(package['custom_check'])
    end

    false unless bin_exists? package['executable']
  end
end
