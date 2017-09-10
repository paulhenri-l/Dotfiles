class FileInstaller
  def initialize(options = {})
    @config = YAML.load(File.open 'config/file_installer.yml')
  end

  def install!
    @config['directories'].each { |d| create_directory d }
    @config['files'].each { |f| create_file f }
    @config['symlinks'].each { |s| create_symlink s }
  end

  private
  def create_file(file)
    file_name = File.expand_path file['path']

    unless File.exist? file_name or Dir.exist? file_name or File.symlink? file_name
      new_file = File.new file_name, 'w'
      new_file.puts file['content']
      new_file.close
    end
  end

  def create_directory(directory)
    directory = File.expand_path directory

    unless Dir.exist? directory
      Dir.mkdir directory
    end
  end

  def create_symlink(symlink)
    original = File.expand_path symlink['original']
    destination = File.expand_path symlink['destination']

    unless File.exist? destination or Dir.exist? destination or File.symlink? destination
      FileUtils.ln_s original, destination
    end
  end
end
