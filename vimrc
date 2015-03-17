" -----------------------------------------------------------
" vundle 
" -----------------------------------------------------------
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
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'

" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

call vundle#end()

" -----------------------------------------------------------
" global settings
" -----------------------------------------------------------

set number
"set relativenumber
set hidden
set laststatus=2
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2
set modeline
set t_Co=256
set autowrite
set clipboard=unnamed       " use X11 clipboard always
set diffopt=filler,vertical

imap jj <esc>
nnoremap <space> za
vnoremap <space> za

syntax on
filetype indent plugin on
" colorscheme Monokai
" colorscheme 256-grayvim
" colorscheme devbox-dark-256
" colorscheme wolfpack
" colorscheme monokain
colorscheme herald
set guifont=Monospace\ 12

" -----------------------------------------------------------
" color correction for wolfpack and git-gutter
" -----------------------------------------------------------
" highlight SignColumn guibg=#323332
" highlight GitGutterAdd guibg=#323332
" highlight GitGutterChange guibg=#323332
" highlight GitGutterDelete guibg=#323332
" highlight GitGutterChangeDelete guibg=#323332

" -----------------------------------------------------------
" color correction for herald and git-gutter
" -----------------------------------------------------------
hi clear LineNr
hi SignColumn guibg=#1F1F1F
hi GitGutterAdd guibg=#1F1F1F guifg=green
hi GitGutterChange guibg=#1F1F1F guifg=purple
hi GitGutterDelete guibg=#1F1F1F guifg=red
hi GitGutterChangeDelete guibg=#1F1F1F guifg=red

" -----------------------------------------------------------
" Source the vimrc file after saving it
" -----------------------------------------------------------
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" -----------------------------------------------------------
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" -----------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" -----------------------------------------------------------
" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
" -----------------------------------------------------------
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" ---------------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------------
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#syntastic#enabled = 1

let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = ''
