"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
set background=dark
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
"Plug 'zchee/deoplete-clang'
"Plug 'justmao945/vim-clang'
"Plug 'xaizek/vim-inccomplete'
Plug 'racer-rust/vim-racer'
Plug 'w0rp/ale'
"Plug 'vhdirk/vim-cmake'
"Plug 'dpwright/vim-tup'
Plug 'rust-lang/rust.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'taketwo/vim-ros'

Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'kshenoy/vim-signature'
Plug 'kassio/neoterm'
Plug 'equalsraf/neovim-gui-shim'
"Plug 'Chiel92/vim-autoformat'
call plug#end()
filetype plugin on
filetype indent on

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

set completeopt-=preview

let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-3.8/lib/libclang.so.1"
let g:deoplete#sources#clang#clang_header="/usr/lib/llvm-3.8/lib/clang"
let g:deoplete#sources#clang#flags = [
      \ "-I/usr/local/include",
      \ "-I/usr/include",
      \ "-I/usr/local/include",
      \ "-I/usr/include/x86_64-linux-gnu",
      \ "-I/opt/ros/kinetic/include",
      \]

let g:ale_c_build_dir = "./build"
let g:ale_c_parse_makefile = 1
let g:ale_cpp_gcc_options = '-std=c++14 -isystem /usr/include/c++/v1 -I/usr/include/c++/v1 -I/opt/ros/kinetic/include -I/usr/local/include -I/usr/include -I/usr/include/x86_64-linux-gnu'
let g:ale_cpp_clang_options = '-std=c++14 -isystem /usr/include/c++/v1 -I/usr/include/c++/v1 -I/opt/ros/kinetic/include -I/usr/local/include -I/usr/include -I/usr/include/x86_64-linux-gnu'

let g:clang_compilation_database = "./build"
let g:clang_c_options = '-std=gnu11'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_default_keymappings = 0
let g:clang_use_library = 1
let g:clang_close_preview = 1
let g:clang_cpp_options = ' -std=c++14 -isystem /usr/include/c++/v1 -I/usr/include/c++/v1 -I/opt/ros/kinetic/include'
let g:clang_auto_user_options = 'build/compile_commands.json, .clang_complete, path'
let g:clang_user_options = ' -std=c++14  -I/usr/include/c++/v1 '
let g:inccomplete_showdirs = 1
"let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*', '[^. *\t]\::\w*', '[^. *\t]\->\w*', '#include\s*[<"][^>"]*']
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.cpp = '[^. *\t]\.\w*|[^. *\t]\::\w*|[^. *\t]\->\w*|#include\s*[<"][^>"]*'
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*']
let g:clang_close_preview = 1
let g:clang_auto = 0
let g:clang_diagsopt = ''
let g:clang_verbose_pmenu = 1
let g:clang_pwheight = 4

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<BS>"
let g:clang_c_completeopt = 'menuone,preview,noselect,noinsert'
let g:clang_cpp_completeopt = 'menuone,preview,noselect,noinsert'
let g:inccomplete_addclosebracket = "none"
let g:inccomplete_autoselect = 0

let g:deoplete#sources#rust#racer_binary="/usr/bin/racer"
let g:deoplete#sources#rust#rust_source_path="/usr/src/rust/src/"

let g:neoterm_size = 55
let g:neoterm_automap_keys = '<Leader>r'
let g:neoterm_shell = "zsh"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:solarized_termcolors=256
colorscheme solarized
set mouse=c
set hidden
set visualbell

" Nerd Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

set autoindent                                                                   
set expandtab                                                                    
set tabstop=2                                                                    
set shiftwidth=2
set nolinebreak
set colorcolumn=81
imap fd <Esc>
let mapleader="\<Space>"

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

au FileType c,cpp setlocal comments-=:// comments+=f://
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au BufRead,BufNewFile *.launch set filetype=xml
