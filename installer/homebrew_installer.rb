require 'mkmf'
require 'yaml'

class HomeBrewInstaller
  def initialize(options = {})
    @config = YAML.load(File.open './config/homebrew_installer.yml')
  end

  def install!
    install_homebrew
    @config['taps'].each { |t| add_tap t }
    @config['packages'].each { |p| install_package p }
  end

  private
  def install_homebrew
    if package_exists? 'brew'
      system 'brew update'
    else
      system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
  end

  def add_tap(tap)
    system "brew tap #{tap}" unless tap_exists? tap
  end

  def install_package(package)
    system("brew install #{package['name']}") unless package_exists? package['executable']
  end

  def package_exists?(name)
    find_executable0 name
  end

  def tap_exists?(tap)
    @existing_taps = @existing_taps || %x(brew tap)

    @existing_taps.include? tap
  end
end
