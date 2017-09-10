class NeovimInstaller
  def initialize(options = {})
  end

  def install!
    install_python_extension
    install_plug
    install_plugins
  end

  private
  def install_python_extension
    system 'pip3 install --upgrade neovim'
    system 'pip2 install --upgrade neovim'
  end

  def install_plug
    system 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  end

  def install_plugins
    system 'nvim +PlugInstall +PlugClean +UpdateRemotePlugins +qall'
  end
end
