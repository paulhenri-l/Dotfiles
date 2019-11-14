class FilesInstaller
  def initialize
    config = YAML.load(File.open 'config/files.yml')

    @directories = config['directories']
    @symlinks = config['symlinks']
  end

  def run!
    create_directories @directories
    create_symlinks @symlinks
  end

  private

  def create_directories(directories)
    puts "Creating directories"
    directories.each do |directory|
      directory = File.expand_path directory

      if already_exists? directory
        puts " - [#{directory}] already exists"
      else
        Dir.mkdir directory
        puts " - [#{directory}] created"
      end
    end
  end

  def create_symlinks(symlinks)
    puts "Creating symlinks"
    symlinks.each do |symlink|
      original = File.expand_path symlink['original']
      destination = File.expand_path symlink['destination']

      if already_exists? destination
        puts " - [#{destination}] already exists"
      else
        FileUtils.ln_s original, destination
        puts " - [#{destination}] symlinked"
      end
    end
  end

  def already_exists?(destination)
    File.exist? destination or Dir.exist? destination or File.symlink? destination
  end
end
