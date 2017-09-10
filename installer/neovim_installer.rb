class NeovimInstaller
  def install!
    install_plug
    install_plugins
  end

  private
  def install_plug
    system "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  end

  def install_plugins
    system "nvim +PlugInstall +PlugClean +UpdateRemotePlugins"
  end
end
