set number
set tabstop=2 shiftwidth=2 expandtab
set hlsearch
let mapleader =" "
set redrawtime=10000

"Movement
noremap j h
noremap k j
noremap l k
noremap ; l
map <C-j>  10j
nmap <C-k>  10k
map <C-l>  10l
map <C-;>  10;
noremap ] }ge$
noremap [ {w
noremap <silent><C-]> /;<CR>:noh<CR>
noremap <silent><C-b> ?\v^(module\s)*\s*\w+\s(u_\w+\s)*#*\(<CR>:noh<CR>
noremap <silent><C-n> /\v^(module\s)*\s*\w+\s(u_\w+\s)*#*\(<CR>:noh<CR>zz
nnoremap zx za
nnoremap zc zM
nnoremap zv zr
nnoremap zb zk
nnoremap zn zj
vnoremap <silent><C-k> :<C-U>call cursor(line("'}")-1,col("'>"))<CR>`<1v``

"Commands
noremap <leader>r :set relativenumber!<ENTER>
noremap <leader>n :set number!<ENTER>
noremap <leader>h :noh<ENTER>
noremap <leader>w :%s/\s\+$//e<enter>
noremap <leader>f :f<ENTER>
noremap <leader>; vip:s/,$/;/<enter>
noremap <leader>, vip:s/\(\w\+\)\(;\)/.\1 (\1),/<enter>
noremap <leader>4 ifor (int i = 0; i < ; i++){<enter><esc>k19la
noremap <C-s> :%s/

"Insert Mode
inoremap jk <ESC>
inoremap JK <ESC>
inoremap <C-e> <esc>ea
inoremap <C-b> <esc>bi
inoremap <C-j> <Left>
inoremap <C-k> <Down>
inoremap <C-l> <Up>
inoremap <C-;> <Right>
inoremap <C-]> <esc>]a
inoremap <C-[> <esc>[i
inoremap begin<CR> begin<CR>end<UP><Right><Right><CR>
inoremap {<CR> {<CR>}<up><CR>

syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus
autocmd BufNewFile,BufRead *.v,*.vs,*.sv set syntax=verilog
set pastetoggle=<F1>
set backspace=indent,eol,start
set ignorecase
set smartcase
set showcmd
set foldmethod=indent
set foldlevel=99
set incsearch

au BufNewFile,BufRead ?\+.php exe "doau filetypedetect BufRead " . fnameescape(expand("<afile>:r"))

"Colours
let g:rainbow_active = 1

"vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'
Plug 'powerline/powerline'
call plug#end()

"EasyAlign remaps
xmap ga <Plug>(EasyAlign)
noremap ga <Plug>(EasyAlign)
noremap <leader>a vipga<C-x>
noremap <leader>s vipga

"NerdTree remaps
noremap <leader>t :NERDTreeToggle<CR>

"Floatterm remaps
noremap <leader>q :FloatermToggle<CR>
tmap <leader>q <C-\><C-n>:FloatermToggle<CR>
