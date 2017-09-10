set nocompatible                                   " This must be first, because it changes other options as side effect

"-----GUI Settings-----"
set guifont=Operator\ Mono:h14
set guioptions-=T                                  " Removes top toolbar
set guioptions-=r                                  " Removes right hand scroll bar
set go-=L                                          " Removes left hand scroll bar

"-----General Settings-----"
filetype plugin on                                 " Enable filtype plugins
set updatetime=250                                 " Lower update time
set shell=/bin/zsh                                 " Use zsh as the shell
set scrolloff=5                                    " Start scroll when no more than 5 lines till bottom
set mouse=a                                        " Enable mouse
set clipboard:unnamed                              " Use system clipboard
set backspace=indent,eol,start                     " Make backspace behave like every other editor.
set relativenumber                                 " Activate line numbers
set autoread                                       " Auto read when file is changed from outside
set formatoptions-=tc                              " Stop VIM from splitting lines
set noerrorbells visualbell t_vb=                  " No damn bells!
set cursorline                                     " Highlight the current line.
set showmatch                                      " Hilight matching )}
set autowrite                                      " Save on buffer switch

"Tags
set tags=./tags,tags                               " Manually set the tag file
set path=.                                         " Should speed up tag search

"Responsiveness
set ttyfast                                        " faster redrawing
set timeout timeoutlen=2500 ttimeoutlen=100         " Make escape key more responsive

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
set listchars=tab:→\ ,trail:.                      " What should invisibles look like
set list                                           " Show invisibles

"Split
set splitbelow                                     " Split always below
set splitright                                     " Split always on the right

"Temp files
set backupdir=~/.config/vim-global/bak             " where to put backup file
set dir=~/.config/vim-global/tmp                   " tell vim where to put swap files

"Quickfix
nnoremap <Leader><Leader><Space> :ccl<cr>

"-----Styling-----"
syntax enable                                      " Syntax higlighting
set t_Co=256                                       " 256 colors term
set termguicolors                                  " Enable guicolors in term
" colorscheme basic-dark
" colorscheme spring-night
colorscheme spacegray
" colorscheme ubaryd
hi CursorLine cterm=NONE                           " Remove cursorline underline
hi VertSplit guifg=bg guibg=bg                     " Hide the vertical split bar

"-----Auto commands-----"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
    autocmd BufWritePost init.vim source $MYVIMRC
    autocmd BufWritePost plugins.vim source $MYVIMRC
    autocmd BufWritePost global_config.vim source $MYVIMRC
    autocmd BufWritePost global_mappings.vim source $MYVIMRC
augroup end

"AutoComplete - Close preview window on complete done
autocmd CompleteDone * pclose
