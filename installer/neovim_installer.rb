class NeovimInstaller
  def run!
    puts "Installing neovim"
    install_prerequisites
    install_plug
    install_plugins
    puts " - Done"
  end

  private

  def install_prerequisites
    puts " - Install prerequisites"
    system "pip3 install --upgrade neovim"
    system "gem install neovim"
  end

  def install_plug
    puts " - Install plug"
    system "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  end

  def install_plugins
    puts " - Install plugins"
    system "nvim +PlugInstall +PlugClean +UpdateRemotePlugins +qall"
  end
end
