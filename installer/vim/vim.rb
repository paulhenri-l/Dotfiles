require_relative './vim_directory'
require_relative './vim_plugins'
require_relative './vim_plugins_compiler'

module Vim
  class Vim
    def initialize(owner_dir, compile)
      @owner_dir = owner_dir
      @compile = compile
    end

    def install!
      VimDirectoryInstaller.new(@owner_dir).run!
      VimPlugins.new(@owner_dir).run!
      VimPluginCompiler.new(@owner_dir).run! if @compile
    end
  end
end
