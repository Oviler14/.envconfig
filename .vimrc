set number
set tabstop=2 shiftwidth=0 expandtab
set hlsearch
let mapleader =" "
set redrawtime=10000
nmap <leader>r :set relativenumber!<ENTER>
nmap <leader>n :set number!<ENTER>
nmap <leader>h :noh<ENTER>
nmap <leader>w :%s/\s\+$//e<enter>
nmap <leader>f :f<ENTER>
nmap <leader>; vip:s/,$/;/<enter>
nmap <leader>, vip:s/\(\w\+\)\(;\)/.\1 (\1),/<enter>
nmap <leader>4 ifor (int i = 0; i < ; i++){<enter><esc>k19la
nmap <leader>c dt,
inoremap jk <ESC>
inoremap JK <ESC>
vnoremap jk <ESC>
vnoremap JK <ESC>
inoremap begin<CR> begin<CR><CR>end<UP>
inoremap () ()<left>
inoremap {<CR> {<CR><CR>}<up>
syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus
autocmd BufNewFile,BufRead *.v,*.vs,*.sv set syntax=verilog
set pastetoggle=<F1>
set backspace=indent,eol,start
set ignorecase
set smartcase

"Colours
let g:rainbow_active = 1

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'
call plug#end()

"EasyAlign remaps
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <leader>a vipga<C-x>
nmap <leader>s vipga

"NerdTree remaps
nmap <leader>t :NERDTreeToggle<CR>

"Floatterm remaps
nmap <leader>q :FloatermToggle<CR>
tmap <leader>q <C-\><C-n>:FloatermToggle<CR>
