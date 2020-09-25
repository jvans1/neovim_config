if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading plug.vim to ~/.config/nvim/autoload/plug.vim"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' 
Plug 'tpope/vim-fugitive'
Plug 'yegappan/mru'
Plug 'https://github.com/tell-k/vim-autopep8'
Plug 'https://github.com/tpope/vim-surround'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'nvie/vim-flake8'
call plug#end()


"java 
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


"autopep 8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1


" File tree browser
map \ :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>


" move items in quickfix
noremap ]q :cn<CR>
noremap [q :cp<CR>

let mapleader=","
noremap <leader>s :%s/
noremap <leader>f :FZF<ENTER>
noremap <leader>a "zyiw:exe " Ag --ignore=tags ".@z."" <CR>
noremap <leader>w yiw
noremap <leader>p viwp

set tabstop=2 shiftwidth=2 expandtab
set number
set nowrap

" Go plugins
nmap <leader>b :GoTestFunc<CR>

syntax on

noremap <space> :noh<cr>

map <leader>rt :!/usr/local/bin/ctags -R --exclude=.git --exclude=build --exclude=log *  <CR>

"mru
noremap <leader>m :MRU<ENTER> | fzf

"auto flake8
"autocmd BufWritePost *.py call flake8#Flake8()

