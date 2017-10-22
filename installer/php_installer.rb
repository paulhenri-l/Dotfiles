class PhpInstaller
  def initialize(options = {})
    @config = YAML.load(File.open 'config/php_installer.yml')
  end

  def install!
    require_composer_packages @config['packages']
  end

  private

  def require_composer_packages(packages)
    system "composer global require #{packages.join(' ')}"
  end
end
