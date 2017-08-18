class VimPlugins
  def initialize
    owner_dir = File.expand_path '~'
    @vundle_dir = "#{owner_dir}/.vim/bundle/Vundle.vim"
  end

  def run!
    install_vundle
    install_plugins
  end

  private
  def install_vundle
    if Dir.exist? @vundle_dir
      system "cd #{@vundle_dir} && git pull && cd -"
    else
      system "git clone https://github.com/VundleVim/Vundle.vim.git #{@vundle_dir}"
    end
  end

  def install_plugins
    system 'vim +PluginInstall +qall'
  end
end
