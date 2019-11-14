class CasksInstaller
  def initialize
    @casks = YAML.load(File.open "./config/casks.yml") || []
  end

  def run!
    puts "Installing casks"
    @casks.each do |cask|
      if cask_already_installed cask
        puts " - [#{cask['name']}] already installed"
      else
        system("brew cask install #{cask["name"]}")
        puts " - [#{cask['name']}] installed"
      end
    end
    puts " - Done"
  end

  private

  def cask_already_installed(cask)
    @installed_casks ||= %x(brew cask list)
    listed = @installed_casks.include?(cask["name"])
    directoryExists = Dir.exist?(cask["path"])

    listed || directoryExists
  end
end
