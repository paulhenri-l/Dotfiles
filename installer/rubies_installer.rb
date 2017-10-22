class RubiesInstaller
  def initialize(options = {})
    @config = YAML.load(File.open './config/rubies_installer.yml')
  end

  def install!()
    @config['rubies'].each { |r| run_installation_for r }
  end

  private

  def run_installation_for(ruby_config)
    version, global, gems = ruby_config.values_at('version', 'global', 'gems')

    install_ruby(version, global)
    install_gems(version, gems)
  end

  def install_ruby(ruby_version, rbenv_global)
    system "rbenv install #{ruby_version}" unless already_installed? ruby_version

    if rbenv_global
      system "rbenv global #{ruby_version}"
      system "rbenv rehash"
    end
  end

  def install_gems(ruby_version, gems)
    set_ruby_version ruby_version

    installed_gems = `~/.rbenv/shims/gem list`

    gems.each do |gem|
      next if installed_gems.include? gem
      puts "Installing gem #{gem}" 
      system("~/.rbenv/shims/gem install #{gem}")
    end

    system "rbenv rehash"
    unset_ruby_version
  end

  def already_installed?(ruby_version)
    `rbenv versions`.include? ruby_version
  end

  def set_ruby_version(ruby_version)
    system "rbenv local #{ruby_version}"
  end

  def unset_ruby_version
    system "rbenv local --unset"
  end
end
