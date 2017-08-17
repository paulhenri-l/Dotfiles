set nocompatible                                   " This must be first, because it changes other options as side effect
so ~/.vim/plugins.vim                              " Plugins loader

"-----General Settings-----"
filetype plugin on                                 " Enable filtype plugins
set updatetime=250                                 " Lower update time
set shell=/bin/zsh                                 " Use zsh as the shell
set scrolloff=5                                    " Start scroll when no more than 5 lines till bottom
set mouse=a                                        " Enable mouse
set clipboard:unnamed                              " Use system clipboard
set backspace=indent,eol,start                     " Make backspace behave like every other editor.
set number                                         " Activate line numbers
set autoread                                       " Auto read when file is changed from outside
set formatoptions-=tc                              " Stop VIM from splitting lines
set noerrorbells visualbell t_vb=                  " No damn bells!
set cursorline                                     " Highlight the current line.
set showmatch                                      " Hilight matching )}
set autowrite                                      " Save on buffer switch

"Tags
set tags=tags                                      " Manually set the tag file
set path=.                                         " Should speed up tag search

"Responsiveness
set ttyfast                                        " faster redrawing
set timeout timeoutlen=700 ttimeoutlen=100         " Make escape key more responsive

"Tabs
set nowrap                                         " No line wrapping
set tabstop=4                                      " Use 4 spaces by default for tabs
set autoindent                                     " Auto indent obviously
set smarttab
set softtabstop=4                                  " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                                      " expand tabs by default (overloadable per file type later)
set shiftwidth=4                                   " number of spaces to use for autoindenting
set shiftround                                     " use multiple of shiftwidth when indenting with '<' and '>'
set copyindent                                     " copy the previous indentation on autoindenting

"Search
set smartcase                                      " case-sensitive if expresson contains a capital letter
set ignorecase                                     " case insensitive searching
set hlsearch                                       " Hilight search results
set incsearch                                      " Incremental search

"Invisbles
set listchars=tab:▒░,trail:.                       " What should invisibles look like
set list                                           " Show invisibles

"Split
set splitbelow                                     " Split always below
set splitright                                     " Split always on the right

"Temp files
set backupdir=~/.vim/bak                           " where to put backup file
set dir=~/.vim/tmp                                 " tell vim where to put swap files

"-----Styling-----"
syntax enable                                      " Syntax higlighting
set t_Co=256                                       " 256 colors term
set termguicolors                                  " Enable guicolors in term
"colorscheme basic-dark
colorscheme spring-night
hi CursorLine cterm=NONE                           " Remove cursorline underline
hi VertSplit guifg=bg guibg=bg                     " Hide the vertical split bar

"-----Mapping-----"
let mapleader = ','

"Open the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<CR>:vsp<CR>:e ~/.vim/plugins.vim<CR>gph
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<CR>

"No hilight search
nmap <Leader><Space> :nohlsearch<CR>

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Tab
nmap <Leader>nt :tabnew<CR>

"Pane navigation with ctrl+hjkl
nmap <Leader>np :vsp<CR>
nmap <Leader>nP :sp<CR>
nmap gpj <C-W><C-J>
nmap gpk <C-W><C-K>
nmap gph <C-W><C-H>
nmap gpl <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Easy escaping to normal mode
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"NerdTree
nmap <Leader>& :NERDTreeToggle<cr>

"-----Auto commands-----"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
    autocmd BufWritePost plugins.vim source $MYVIMRC
augroup end
