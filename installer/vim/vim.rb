require_relative './vim_directory'
require_relative './vim_plugins'
require_relative './vim_plugins_compiler'

module Vim
  class Vim
    def initialize(compile)
      @compile = compile
    end

    def install!
      VimDirectoryInstaller.new.run!
      VimPlugins.new.run!
      VimPluginCompiler.new.run! if @compile
    end
  end
end
