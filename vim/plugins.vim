filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"-----Plugins-----"
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'majutsushi/tagbar'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'vim-syntastic/syntastic'
Plugin '907th/vim-auto-save'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-php-namespace'
"Plugin 'skwp/greplace.vim'
"Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'msanders/snipmate.vim'
"Plugin 'StanAngeloff/php.vim'
"Plugin 'arnaud-lb/vim-php-namespace'
"Plugin 'itchyny/lightline.vim'
"Plugin 'posva/vim-vue'
"-----Plugins end-----"

call vundle#end()
filetype plugin indent on

"-----Plugin configuration-----"

"NerdTree
nmap <Leader>& :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0         "Don't let NerdTree Hijack Vinegar

"CtrlP
nmap œ :CtrlP<cr>
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30' "Results position
" let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|.idea'

"Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

"PHPIndent
let g:PHP_removeCRwhenUnix = 1

"Nerdcomment
nmap <Leader>k <Plug>NERDCommenterToggle<CR>
vmap <Leader>k <Plug>NERDCommenterToggle<CR>
let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1            " Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=PSR2'

"TagBar
nmap <Leader>t :Tagbar<CR>

"Autosave
" let g:auto_save = 1  " enable AutoSave on Vim startup

"Vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"The silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s --skip-vcs-ignores -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
