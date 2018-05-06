set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
command Term e term://zsh

set exrc
set secure

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'amdt/vim-niji'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:solarized_termcolors=256
colorscheme solarized

" Nerd Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

let cwd = getcwd()
if filereadable(cwd + "/.ycm_extra_conf.py")
	let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
endif

au FileType c,cpp setlocal comments-=:// comments+=f://
set autoindent                                                                   
set expandtab                                                                    
set tabstop=2                                                                    
set shiftwidth=2
set nolinebreak
set colorcolumn=81
set mouse=v
imap fd <Esc>
set number
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif
autocmd Filetype clojure setlocal nowrap

let g:ycm_confirm_extra_conf = 0

" Set the type for the file type and override if file type
" already has detected
au BufRead,BufNewFile *.launch set filetype=xml
