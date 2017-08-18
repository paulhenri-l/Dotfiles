module Vim
  class VimPluginCompiler
    def initialize(owner_dir)
      @owner_dir = owner_dir
    end

    def run!
      compile_plugins [
          # {pluginDir: 'YouCompleteMe', compileCommand: './install.py --all'},
          {dir: 'vimproc.vim', compileCommand: 'make'}
      ]
    end

    def compile_plugins(list)
      list.each do |plugin|
        dir = "#{@owner_dir}/.vim/bundle/#{plugin[:dir]}"

        system "cd #{dir} && #{plugin[:compileCommand]} && cd -"
      end
    end
  end
end
