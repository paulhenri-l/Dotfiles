filetype off

"-----Plugins-----"
call plug#begin()

" Navigation
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

" Editor
" Plug 'w0rp/ale'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'skwp/greplace.vim'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" PHP
Plug 'arnaud-lb/vim-php-namespace'
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

" Rust
Plug 'rust-lang/rust.vim'

" other
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'stephpy/vim-yaml'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'cespare/vim-toml'

" Required by other
Plug 'tpope/vim-dispatch'
Plug 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
Plug 'tomtom/tlib_vim' " Required by snipmate

call plug#end()

"-----Netrw-----"
let g:netrw_localrmdir='rmtrash'
let g:netrw_rm_cmd='rmtrash'
let g:netrw_rmf_cmd='rmtrash'

"-----NerdTree-----"
nnoremap <Leader>& :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0
" let NERDTreeShowHidden=1 " Show hidden files

"-----Deoplete-----"
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

"-----CtrlP-----"
nnoremap œ :CtrlP<cr>
nnoremap <S-Tab>   :CtrlPBuffer<cr>
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15results:15'

"-----Vim-airline-----"
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"-----PHPIndent-----"
let g:PHP_removeCRwhenUnix = 1

"-----Vim-commentary-----"
nmap <Leader>k gcc
vmap <Leader>k gcc
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
autocmd FileType php setlocal commentstring=//\ %s

"-----Vim-php-namespace-----"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>

"-----The silver searcher-----"
if executable('ag')
  let g:ctrlp_use_caching = 0
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -p ~/.ag_ignore -l --nocolor -g ""'
endif

"-----Ale-----"
let g:ale_php_phpcs_standard = 'PSR2'

"-----Grep-----"
"Press K to search for the word uner cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

"Press \ To search with Ag
nnoremap \ :Ag<SPACE>

"-----Greplace-----"
let g:grep_cmd_opts = '--line-numbers --noheading'

"-----Alchemist-----"
let g:alchemist#elixir_erlang_src = '~/Sites/Elixir/sources'
let g:alchemist_tag_map = '<leader>f'
let g:alchemist_tag_stack_map = '<leader>pf'
