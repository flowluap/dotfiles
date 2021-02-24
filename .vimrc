set encoding=UTF-8
" Auto Install Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
set nocompatible              " be iMproved, required
execute pathogen#infect()
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'leafoftree/vim-svelte-plugin'
Plug 'https://github.com/PhilRunninger/nerdtree-visual-selection.git'
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()            " required
filetype plugin indent on    " required

colorscheme simple-dark
:set relativenumber
set number

vmap +y :w! /tmp/.vbuf<CR>                                                                   
nmap +p :r! cat /tmp/.vbuf<CR>

" Fuzzy file finder
let g:fzf_preview_window = ['right:60%']
noremap <S-F> :Files<cr>
noremap <C-F> :Ag<cr>
let g:coc_disable_startup_warning = 1

autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
let g:prettier#autoformat = 0
autocmd BufWritePre *.svelte,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
