require "FileUtils"

# Vim config file
vim_config = File.absolute_path 'vim/config.vim'
vim_plugins = File.absolute_path 'vim/plugins.vim'
vim_colors = File.absolute_path 'vim/colors'
owner_directory = File.expand_path '~'

# Symlink the vimrc file
File.symlink vim_config, "#{owner_directory}/.vimrc"

# Create the config directory
Dir.mkdir "#{owner_directory}/.vim"
Dir.mkdir "#{owner_directory}/.vim/bak"
Dir.mkdir "#{owner_directory}/.vim/tmp"
Dir.mkdir "#{owner_directory}/.vim/bundle"

# Symlink colors
FileUtils.ln_s vim_colors, "#{owner_directory}/.vim/colors"

# Symlink plugins
File.symlink vim_plugins, "#{owner_directory}/.vim/plugins.vim"

# Install Vundle
system "git clone https://github.com/VundleVim/Vundle.vim.git #{owner_directory}/.vim/bundle/Vundle.vim"

# Install required programs
# system "brew install ctags"
# system "brew install the_silver_searcher"

# Install VimPlugins
system "vim +PluginInstall +qall"

# Compile You complete me
# brew install cmake && cd ~/.vim/bundle/YouCompleteMe && ./install.py --all && cd -

# Compile vimproc
# cd ~/.vim/bundle/vimproc && make && cd -

# The Silver Searcher
global_ag_ignore = File.absolute_path 'global_ag_ignore'
File.symlink global_ag_ignore, "#{owner_directory}/.agignore"
