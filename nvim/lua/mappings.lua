vim.filetype.add({extensions = {php = "systemverilog"}})

vim.cmd([[
set number
set tabstop=2 shiftwidth=2 expandtab
set hlsearch
let mapleader =" "
set redrawtime=10000
set nosplitright

"Movement
noremap j h
noremap k j
noremap i k
noremap h i
noremap J h
noremap K j
noremap I k
noremap H I
noremap L l
map <C-j>  20j
nmap <C-k>  10k
map <C-l>  20l
map <C-i>  10i
noremap ] }ge$
noremap [ {w
noremap <silent><C-]> /;<CR>:noh<CR>
noremap <silent><C-b> ?\v^(module\s)*\s*\w+\s*(u_\w+\s*)*#*\(<CR>:noh<CR>
noremap <silent><C-n> /\v^(module\s)*\s*\w+\s*(u_\w+\s*)*#*\(<CR>:noh<CR>zz
nnoremap zx za
nnoremap zc zM
nnoremap zv zr
nnoremap zb zk
nnoremap zn zj
vnoremap <silent><C-k> :<C-U>call cursor(line("'}")-1,col("'>"))<CR>`<1v``
vnoremap h i
vnoremap H I
noremap <A-j> <C-w>h
noremap <A-l> <C-w>l

"Commands
noremap <leader>r :set relativenumber!<ENTER>
noremap <leader>n :set number!<ENTER>
noremap <leader>h :noh<ENTER>
noremap <leader>w :%s/\s\+$//e<enter>
noremap <leader>f :f<ENTER>
noremap <leader>; vhp:s/,$/;/<enter>
noremap <leader>, vhp:s/\(\w\+\)\(;\)/.\1 (\1),/<enter>
noremap <leader>4 ifor (int i = 0; i < ; i++){<enter><esc>k19la
noremap <C-s> :%s/

"Insert Mode
inoremap jk <ESC>
inoremap JK <ESC>
inoremap <C-e> <esc>ea
inoremap <C-b> <esc>bi
inoremap <C-j> <Left>
inoremap <C-k> <Down>
inoremap <C-l> <Right>
inoremap <C-J> <Left>
inoremap <C-K> <Down>
inoremap <C-L> <Right>
inoremap <C-]> <esc>]a
inoremap begin<CR> begin<CR>end<UP><Right><Right><CR>
inoremap {<CR> {<CR>}<up><CR>

syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus
set pastetoggle=<F1>
set backspace=indent,eol,start
set ignorecase
set smartcase
set showcmd
set foldmethod=indent
set foldlevel=99
set incsearch

autocmd BufNewFile,BufRead *.v,*.sv,*.sv.php,*.v.php set filetype=verilog

]])

