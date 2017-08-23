class VimInstaller
  def initialize(options = {})
    @should_compile = options[:compile]
    @config = YAML.load(File.open 'config/vim_installer.yml')
  end

  def install!
    install_vundle
    @config['compile_plugins'].each { |p| compile_plugin p } if @should_compile
  end

  private
  def install_vundle
    vundle_dir = File.expand_path '~/.vim/bundle/Vundle.vim'

    unless Dir.exist?(vundle_dir)
      system "git clone https://github.com/VundleVim/Vundle.vim.git #{vundle_dir}"
    end

    system "cd #{vundle_dir} && git pull && cd -"
    system 'mvim -v +PluginInstall +qall'
    system 'mvim -v +PluginClean +qall'
  end

  def compile_plugin(plugin)
    system "cd #{plugin['plugin_directory']} && #{plugin['compile_command']} && cd -"
  end
end
