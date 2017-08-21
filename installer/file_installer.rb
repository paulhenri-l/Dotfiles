require 'yaml'

class FileInstaller
  def initialize(options = {})
    @config = YAML.load(File.open 'config/file_installer.yml')
  end

  def install!
    @config['directories'].each { |d| create_directory d }
    @config['symlinks'].each { |s| create_symlink s }
  end

  private
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
