module Vim
  class VimDirectoryInstaller
    def initialize
      @ownerDirectory = File.expand_path '~'
      @vimConfig = File.absolute_path 'files/vim/config.vim'
      @vimPlugins = File.absolute_path 'files/vim/plugins.vim'
      @vimColors = File.absolute_path 'files/vim/colors'
      @vimFtplugins = File.absolute_path 'file/vim/ftplugins'
    end

    def run!
      create_directories
      create_symlinks
    end

    private
    def create_directories
      create_dir '.vim'
      create_dir '.vim/bak'
      create_dir '.vim/tmp'
      create_dir '.vim/bundle'
    end

    def create_symlinks
      create_symlink @vimConfig, '.vimrc'
      create_symlink @vimColors, '.vim/colors'
      create_symlink @vimFtplugins, '.vim/ftplugins'
      create_symlink @vimPlugins, '.vim/plugins.vim'
    end

    def create_symlink(old, new)
      new = "#{@ownerDirectory}/#{new}"

      unless File.exist? new or Dir.exist? new or File.symlink? new
        FileUtils.ln_s old,new
      end
    end

    def create_dir(dir)
      dir = "#{@ownerDirectory}/#{dir}"

      unless Dir.exists? dir
        Dir.mkdir dir
      end
    end
  end
end
