" vundle ============================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/a.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'wting/rust.vim'
Plugin 'carlson-erik/wolfpack'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

call vundle#end()
" vundle ============================

set number
"set relativenumber

imap jj <esc>
nnoremap <space> za
vnoremap <space> za

set hidden
set laststatus=2
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2

syntax on
filetype indent plugin on
" colorscheme Monokai
" colorscheme 256-grayvim
" colorscheme devbox-dark-256
colorscheme wolfpack
set modeline
set t_Co=256

" Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set guifont=Monospace\ 12

