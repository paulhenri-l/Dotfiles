set nocompatible                                   " This must be first, because it changes other options as side effect

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

"-----General Settings-----"
filetype plugin on                                 " Enable filtype plugins
set updatetime=250                                 " Lower update time
set shell=/bin/zsh                                 " Use zsh as the shell
set scrolloff=5                                    " Start scroll when no more than 5 lines till bottom
set mouse=a                                        " Enable mouse
set clipboard:unnamed                              " Use system clipboard
set backspace=indent,eol,start                     " Make backspace behave like every other editor.
set relativenumber                                 " Activate line numbers
set number                                         " Show current line number
set autoread                                       " Auto read when file is changed from outside
set formatoptions-=tc                              " Stop VIM from splitting lines
set noerrorbells visualbell t_vb=                  " No damn bells!
set cursorline                                     " Highlight the current line.
set showmatch                                      " Highlight matching )}
set autowrite                                      " Save on buffer switch

"Tags
set tags=./tags,tags                               " Manually set the tag file
set path=.                                         " Should speed up tag search

"Responsiveness
set ttyfast                                        " faster redrawing
set timeout timeoutlen=700 ttimeoutlen=10          " Make escape key more responsive

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
set backupdir=~/.config/nvim/bak                   " where to put backup file
set dir=~/.config/nvim/tmp                         " tell vim where to put swap files

"Completion
set completeopt-=preview                           " Disable completion preview

"Quickfix
nnoremap <Leader><Leader><Space> :ccl<cr>

"Folds
set foldmethod=syntax
set nofoldenable
set foldlevel=100

"Undo history
" set undofile " Maintain undo history between sessions
" set undodir=~/.config/nvim/undo_history

"-----Python------"
" let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"-----Mapping-----"
let mapleader = ','

"Open the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<CR>:vsp<CR>:e ~/.config/nvim/plugins.vim<CR>gph

"Open the snippets folder
nmap <Leader>es :tabedit ~/.config/nvim/snippets/<CR>

"No hilight search
nnoremap <Leader><Space> :nohlsearch<CR>

"Disable arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

"Tab
nnoremap <Leader>nt :tabnew<CR>

"Pane navigation with ctrl+hjkl
nnoremap <Leader>np :vsp<CR>
nnoremap <Leader>nP :sp<CR>
nnoremap gpj <C-W><C-J>
nnoremap gpk <C-W><C-K>
nnoremap gph <C-W><C-H>
nnoremap gpl <C-W><C-L>

"Buffer navigation
nnoremap <Tab> :bu#<CR>
nnoremap d<Tab> :bd<CR>
nnoremap D<Tab> :bufdo bd<CR>

"Resize panes with shift + up - down -right - left
noremap <silent> <S-Left> <C-w><
noremap <silent> <S-Up> <C-W>-
noremap <silent> <S-Down> <C-W>+
noremap <silent> <S-Right> <C-w>>

"Auto change directory to match current file ,cd
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

"Tags
nnoremap <Leader>f <C-]>
nnoremap <Leader>F :tag
nnoremap <Leader>pf <C-T>

"Sort
vnoremap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"-----Auto commands-----"
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source $MYVIMRC
    autocmd BufWritePost plugins.vim source $MYVIMRC
augroup end

"AutoComplete - Close preview window on complete done
autocmd CompleteDone * pclose

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"-----Plugins-----"
so ~/.config/nvim/plugins.vim                      " Plugins loader

"-----Styling-----"
syntax enable                                      " Syntax higlighting
set t_Co=256                                       " 256 colors term
set termguicolors                                  " Enable guicolors in term

"-----Color scheme-----"

colorscheme dracula
let g:airline_theme='dracula'

" Ayu
" colorscheme ayu
" let ayucolor='mirage'
" let g:airline_theme = 'ayu_mirage'

" Gruvbox
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italic = 1
" let g:gruvbox_invert_selection = 0
" let g:gruvbox_sign_column = 'bg0'
" let g:airline_extensions = []
" set background=dark

" JellyBeans
" colorscheme jellybeans
" let g:airline_theme = 'jellybeans'

" Overrides
" hi CursorLine cterm=NONE ctermfg=fg                " Remove cursorline underline
hi VertSplit guifg=bg guibg=bg                     " Hide the vertical split bar
hi NonText guifg=#96ED90                           " Change invisibles color
hi SpecialKey guifg=#96ED90                        " Change invisibles color

" Folds
function! FoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2)
    let fillcharcount = windowwidth - len(line)

    return line . repeat(" ", fillcharcount)
endfunction

set foldtext=FoldText()
