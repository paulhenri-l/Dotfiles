require "FileUtils"

class VimDirectory
  def initialize(owner_directory = nil)
    @ownerDirectory = owner_directory
    @vimConfig = File.absolute_path 'vim/config.vim'
    @vimPlugins = File.absolute_path 'vim/plugins.vim'
    @vimColors = File.absolute_path 'vim/colors'
    puts @ownerDirectory
    puts @vimConfig
    puts @vimPlugins
    puts @vimColors
  end

  def createDirectories
    Dir.mkdir @ownerDirectory unless Dir.exists? @ownerDirectory
    Dir.mkdir "#{@ownerDirectory}/.vim" unless Dir.exists? "#{@ownerDirectory}/.vim"
    Dir.mkdir "#{@ownerDirectory}/.vim/bak"unless Dir.exists? "#{@ownerDirectory}/.vim/bak"
    Dir.mkdir "#{@ownerDirectory}/.vim/tmp"unless Dir.exists? "#{@ownerDirectory}/.vim/tmp"
    Dir.mkdir "#{@ownerDirectory}/.vim/bundle"unless Dir.exists? "#{@ownerDirectory}/.vim/bundle"
  end

  def createSymlinks
      FileUtils.ln_s @vimConfig, "#{@ownerDirectory}/.vim/colors" unless File.symlink? "#{@ownerDirectory}/.vim/colors"
      File.symlink @vimPlugins, "#{@ownerDirectory}/.vim/plugins.vim" unless File.symlink? "#{@ownerDirectory}/.vim/plugins.vim"
  end
end

