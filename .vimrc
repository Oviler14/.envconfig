"General settings
set number
set tabstop=4 shiftwidth=0 expandtab
set hlsearch
let mapleader =" "
inoremap jk <ESC>
inoremap JK <ESC>
vnoremap jk <ESC>
vnoremap JK <ESC>
nmap <leader>r :set relativenumber!<ENTER>
nmap <leader>n :set number!<ENTER>
nmap <leader>h :noh<ENTER>
nmap <leader>w :%s/\s\+$//e<enter>
nmap <leader>f :f<ENTER>
nmap ^[h <C-w>h 
syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus
autocmd BufNewFile,BufRead *.v,*.vs,*.sv set syntax=verilog
set pastetoggle=<F1>
nmap <C-i> i<F1>

"Colours
color desert
let g:rainbow_active = 1 

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
call plug#end()

"EasyAlign remaps
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <leader>a vipga<C-x>
nmap <leader>s vipga

"NerdTree remaps
nmap <leader>t :NERDTreeToggle<CR>
