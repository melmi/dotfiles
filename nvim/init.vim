" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-scripts/a.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tComment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" -----------------------------------------------------------
" global settings
" -----------------------------------------------------------

set number
"set relativenumber
set hidden
set laststatus=2
set modeline
set t_Co=256
set autowrite
set clipboard=unnamed       " use X11 clipboard always
set diffopt=filler,vertical
set showcmd

imap jj <esc>
nnoremap <space> za
vnoremap <space> za

syntax on
filetype indent plugin on
" colorscheme herald " this is a good one
" let g:seoul256_background = 236
" colorscheme seoul256
" colorscheme happy_hacking
colorscheme herokudoc-gvim

" ---------------------------------------------------------------------------
" deoplete
" ---------------------------------------------------------------------------
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-4.0/lib/clang/4.0.1/'
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" ---------------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------------
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#syntastic#enabled = 1

let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_right_sep = ' '

" -----------------------------------------------------------
" CtrlP
" -----------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bin/*,*/out/*
set wildignore+=*/tmp/*,*.pdf,*.docx,*.gnumeric

" -----------------------------------------------------------
" automatically strip whitespaces on save. works with vim-better-whitespace
" https://github.com/ntpeters/vim-better-whitespace
" -----------------------------------------------------------
autocmd BufWritePre * StripWhitespace

" -----------------------------------------------------------
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" ----------------------------------------------------------0
" nnoremap <C-S-J> <C-W><C-J>
" nnoremap <C-S-K> <C-W><C-K>
" nnoremap <C-S-L> <C-W><C-L>
" nnoremap <C-S-H> <C-W><C-H>
set splitbelow
set splitright
