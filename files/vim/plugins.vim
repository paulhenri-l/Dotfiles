filetype off

"-----Plugins-----"
call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'StanAngeloff/php.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'w0rp/ale'
Plug '907th/vim-auto-save'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'alvan/vim-php-manual'
Plug 'skwp/greplace.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'tobyS/pdv'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'stephpy/vim-yaml'
"Plug 'posva/vim-vue'
call plug#end()

"-----Netrw-----"
let g:netrw_localrmdir='rmtrash'
let g:netrw_rm_cmd='rmtrash'
let g:netrw_rmf_cmd='rmtrash'

"-----NerdTree-----"
nnoremap <Leader>& :NERDTreeToggle<cr>
let NERDTreeHijackNetrw = 0

"-----YouCompleteMe-----"
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']

"-----CtrlP-----"
nnoremap œ :CtrlP<cr>
nnoremap <S-Tab>   :CtrlPBuffer<cr>
nnoremap <Leader><S-t> :CtrlPTag<CR>
let g:ctrlp_by_filename = 1
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

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

"-----Ale-----"
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'ruby': [],
\}
let g:ale_php_phpcs_standard='PSR2'

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
  let g:ctrlp_user_command = 'ag %s -p ~/.ag_ignore -l --nocolor -g ""'
endif

"-----Grep-----"
"Press K to search for the word uner cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

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

"-----PHP refactoring-----"
let g:vim_php_refactoring_use_default_mapping = 0
nnoremap  <Leader>pda :call PhpDocAll()<CR>
nnoremap  <Leader>peu :call PhpExtractUse()<CR>
nnoremap  <Leader>prm :call PhpRenameMethod()<CR>
vnoremap  <Leader>p== :call PhpAlignAssigns()<CR>
vnoremap  <Leader>pec :call PhpExtractConst()<CR>
vnoremap  <Leader>pem :call PhpExtractMethod()<CR>
nnoremap  <Leader>pcog :call PhpCreateGetters()<CR>
nnoremap  <Leader>pnp :call PhpCreateProperty()<CR>
nnoremap  <Leader>pep :call PhpExtractClassProperty()<CR>
nnoremap  <Leader>prcv :call PhpRenameClassVariable()<CR>
nnoremap  <Leader>prlv :call PhpRenameLocalVariable()<CR>
nnoremap  <Leader>psg :call PhpCreateSettersAndGetters()<CR>
nnoremap  <Leader>pdu :call PhpDetectUnusedUseStatements()<CR>
