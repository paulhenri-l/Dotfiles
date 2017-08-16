# Vim config file
vim_config = File.absolute_path 'vim/vim_config'
vim_colors = File.absolute_path 'vim/colors'
owner_directory = File.expand_path '~'

# Symlink the vimrc file
File.symlink vim_config, "#{owner_directory}/.vimrc"

# Create the config directory
Dir.mkdir "#{owner_directory}/.vim"
