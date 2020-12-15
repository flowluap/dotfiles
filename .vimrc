set encoding=UTF-8
set nocompatible             
execute pathogen#infect()
syntax on
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'leafoftree/vim-svelte-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/PhilRunninger/nerdtree-visual-selection.git'
call plug#end()
filetype plugin indent on

colorscheme simple-dark" awesome colorscheme
:set relativenumber

let g:coc_disable_startup_warning = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


if executable('rg')
	  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
