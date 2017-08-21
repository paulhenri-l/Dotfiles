require_relative './abstract_program_installer'

class HomeBrewInstaller < AbstractProgramInstaller
  def initialize(options = {})
    super options
    @config = YAML.load(File.open './config/homebrew_installer.yml')
  end

  def install!
    unless @options['no-brew']
      install_homebrew
      @config['taps'].each { |t| add_tap t }
      @config['packages'].each { |p| install_package p }
    end
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
    system("brew install #{package['name']}") unless bin_exists? package['executable']
  end

  def tap_exists?(tap)
    @existing_taps = @existing_taps || %x(brew tap)

    @existing_taps.include? tap
  end
end
