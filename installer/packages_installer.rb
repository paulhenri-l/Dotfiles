require "mkmf"

class PackagesInstaller
  def initialize
    @packages = YAML.load(File.open "./config/packages.yml") || []
    @installed_packages = %x(brew list)
  end

  def run!
    puts "Installing packages"
    @packages.each do |package|
      if already_installed? package
        puts " - [#{package["name"]}] already installed"
      else
        brew_install package
        run_post_install_command package
        puts " - [#{package["name"]}] installed"
      end
    end
    puts " - Done"
  end

  private

  def already_installed?(package)
    listed = @installed_packages.include?(package["name"])
    executable_exists = find_executable0 package["executable"]

    listed || executable_exists
  end

  def brew_install(package)
    system("brew install #{package["name"]}")
  end

  def run_post_install_command(package)
    system(package["post_command"]) if package["post_command"]
  end
end
