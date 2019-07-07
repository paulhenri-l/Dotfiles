class FileInstaller
  attr_reader :directories, :symlinks

  def initialize()
    config = YAML.load(File.open 'config/file_installer.yml')

    @directories = config['directories']
    @symlinks = config['symlinks']
  end

  def install!
    create_directories directories
    create_symlinks symlinks
  end

  private

  def create_directories(directories)
    directories.each do |directory|
      directory = File.expand_path directory

      next if already_exists? directory

      Dir.mkdir directory
    end
  end

  def create_symlinks(symlinks)
    symlinks.each do |symlink|
      original = File.expand_path symlink['original']
      destination = File.expand_path symlink['destination']

      unless already_exists? destination
        FileUtils.ln_s original, destination
      end
    end
  end

  def already_exists?(destination)
    File.exist? destination or Dir.exist? destination or File.symlink? destination
  end
end
