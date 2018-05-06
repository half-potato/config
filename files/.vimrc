set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let background=dark
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
Plugin 'flazz/vim-colorschemes'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/davisdude/vim-love-docs/tree/build'
Plugin 'rdnetto/YCM-Generator'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Lokaltog/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme Benokai

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
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:ycm_confirm_extra_conf = 0

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['black',       'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
