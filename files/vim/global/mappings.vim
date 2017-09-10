"-----Mapping-----"
let mapleader = ','

"Open the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<CR>:vsp<CR>:e ~/.config/nvim/plugins.vim<CR>gph

"Open the snippets folder
nmap <Leader>es :tabedit ~/.vim/snippets/<CR>

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Buffer navigation
nnoremap gbn :bn<CR>
nnoremap gbp :bp<CR>
nnoremap <Tab> :bu#<CR>
nnoremap d<Tab> :bd<CR>
nnoremap D<Tab> :bufdo bd<CR>

"Easy escaping to normal mode
inoremap jj <esc>

"Move lines alt+(j|k)
nnoremap È :m .-2<CR>==
nnoremap Ï :m .+1<CR>==

"Resize panes with shift + up - down -right - left
noremap <silent> <S-Left> <C-w><
noremap <silent> <S-Up> <C-W>-
noremap <silent> <S-Down> <C-W>+
noremap <silent> <S-Right> <C-w>>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"Tags
nnoremap <Leader>f <C-]>
nnoremap <Leader>F :tag 
nnoremap <Leader>pf <C-T>

"Sort
vnoremap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

