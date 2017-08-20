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
Plugin 'vim-php/tagbar-phpctags.vim'
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
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-php-manual'
Plugin 'skwp/greplace.vim'
Plugin 'stephpy/vim-php-cs-fixer'
"Plugin 'posva/vim-vue'
"-----Plugins end-----"

call vundle#end()
filetype plugin indent on

"-----Plugin configuration-----"

"-----NerdTree-----"
nnoremap <Leader>& :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0

"-----CtrlP-----"
nnoremap œ :CtrlP<cr>
nnoremap <Leader><S-t> :CtrlPTag<CR>
let g:ctrlp_by_filename = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"-----Vim-airline-----"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"-----PHPIndent-----"
let g:PHP_removeCRwhenUnix = 1

"-----Nerdcomment-----"
nmap <Leader>k <Plug>NERDCommenterToggle<CR>
vmap <Leader>k <Plug>NERDCommenterToggle<CR>
let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
let g:NERDAltDelims_java = 1            " Set a language to use its alternate delimiters by default
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting

"-----Syntastic-----"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=PSR2 --ignore=*/tests/*'

"-----TagBar-----"
nnoremap <Leader>t :Tagbar<CR>

"-----PHP Ctags Tagbar-----"
let g:tagbar_phpctags_bin='phpctags'

"-----Autosave-----"
" let g:auto_save = 1  " enable AutoSave on Vim startup

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
  let g:ctrlp_user_command = 'ag %s -p ~/.ag_ignore -U -l --nocolor -g ""'
endif

"-----Grep-----"
"Press K to search for the word uner cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"Press \ To search with Ag
nnoremap \ :Ag<SPACE>

"-----PhpManual-----"
nnoremap <Leader>h :help <C-R><C-W><CR>
nmap <Leader>H <C-h>

"-----Greplace-----"
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"-----PHP-cs-fixer-----"
let g:php_cs_fixer_rules = "@PSR2"
nnoremap <silent><leader>pcs :call PhpCsFixerFixFile()<CR>
