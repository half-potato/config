set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let mapleader="\<Space>"

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
Plugin 'scrooloose/nerdcommenter'
Plugin 'davisdude/vim-love-docs'
Plugin 'rdnetto/YCM-Generator'
Plugin 'amdt/vim-niji'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
" Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:deoplete#enable_at_startup = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_include_dirs = ['/opt/ros/kinetic/include', '/usr/include/x86_64-linux-gnu/', '/usr/include/pcl-1.7', '/usr/include/eigen3', '/usr/local/include', '/opt/ros/kinetic/include/opencv-3.3.1-dev']
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["python"],
        \ "passive_filetypes": ["cpp"] }

let g:solarized_termcolors=256
colorscheme morning

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
set mouse=a
imap fd <Esc>
set number
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif
autocmd Filetype clojure setlocal nowrap
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:ycm_confirm_extra_conf = 0
let g:NERDDefaultAlign = 'left'

" Set the type for the file type and override if file type
" already has detected
au BufRead,BufNewFile *.launch set filetype=xml
