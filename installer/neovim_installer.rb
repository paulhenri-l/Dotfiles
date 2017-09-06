class NeovimInstaller
  def initialize(options = {})
    @config = YAML.load(File.open 'config/neovim_installer.yml')
  end

  def install!
    install_nvim_python
    install_plug
    install_plugins
  end

  private
  def install_nvim_python
    system 'pip2 install --user --upgrade neovim'
  end

  def install_plug
    plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    curl_command = "curl -fLo ~/.config/nvim/autoload/plug.vim #{plug_url}"
    system curl_command
  end

  def install_plugins
    system 'nvim +PlugInstall +PlugClean +qall'
  end
end
