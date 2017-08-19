module Vim
  class VimPluginCompiler
    def initialize
      @owner_dir = File.expand_path '~'
    end

    def run!
      compile_plugins [
          {dir: 'YouCompleteMe', compileCommand: './install.py'},
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