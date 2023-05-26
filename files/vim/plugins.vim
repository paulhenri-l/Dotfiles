filetype off

"-----Plugins-----"
call plug#begin()

" Navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'tiagovla/scope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ahmedkhalf/project.nvim'

" Interface
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Editor
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" other
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-dadbod'

" Required by other
Plug 'tpope/vim-dispatch'
Plug 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
Plug 'tomtom/tlib_vim' " Required by snipmate
Plug 'nvim-lua/plenary.nvim' " Required by telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Required by telescope

call plug#end()

"-----Deoplete-----"
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

"-----Vim-commentary-----"
nmap <Leader>k gcc
vmap <Leader>k gcc
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

"-------VimGo-------"
let g:go_fmt_command = "goimports" "Run goimports along gofmt on each save
let g:go_imports_autosave = 0
let g:go_auto_type_info = 1 "Automatically get signature/type info for object under cursor
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

"-------Rails-------"
let g:dadbod_manage_dbext = 1


"-----Telescope-----"
nnoremap œ :Telescope find_files<cr>
nnoremap \ :Telescope live_grep<cr>
nnoremap K :Telescope grep_string<cr>
lua require('telescope').load_extension('projects')

"-----nvim-tree----"
lua << EOF
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})
EOF
nnoremap <Leader>& :NvimTreeToggle<cr>

"----bufferline----"
lua require("bufferline").setup{}

"-------scope------"
lua require("scope").setup()

"------lualine-----"
lua require('lualine').setup()

"------project-----"
lua require('project_nvim').setup()
