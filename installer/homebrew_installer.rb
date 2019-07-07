require 'mkmf'

class HomebrewInstaller

  attr_reader :taps, :packages

  def initialize()
    config = YAML.load(File.open './config/homebrew_installer.yml')

    @taps = config['taps']
    @packages = config['packages']
  end

  def install!
    install_homebrew
    add_taps taps
    install_packages packages
  end

  private

  def install_homebrew
    if bin_exists? 'brew'
      system 'brew update'
    else
      system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
  end

  def add_taps(taps)
    taps.each do |tap|
      system "brew tap #{tap}" unless tap_exists? tap
    end
  end

  def install_packages(packages)
    packages.each do |package|
      next unless should_install? package

      brew_install package
      run_post_install_command package
    end
  end

  def brew_install(package)
    system("brew install #{package['name']}")
  end

  def run_post_install_command(package)
    system(package['command']) if package['command']
  end

  def tap_exists?(tap)
    @existing_taps = @existing_taps || %x(brew tap)

    @existing_taps.include? tap
  end

  def should_install?(package)
    if package.include? 'custom_check'
      return !system(package['custom_check'])
    end

    return true unless bin_exists? package['executable']
  end

  def bin_exists?(name)
    find_executable0 name
  end
end
