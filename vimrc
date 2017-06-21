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
Plugin 'tComment'
Plugin 'wting/rust.vim'
Plugin 'junegunn/seoul256.vim'
" Plugin 'carlson-erik/wolfpack'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'kien/ctrlp.vim'
Plugin 'matze/vim-tex-fold'
Plugin 'junegunn/goyo.vim'
Plugin 'ntpeters/vim-better-whitespace'
" vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"""
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

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
let g:seoul256_background = 236
colorscheme seoul256
set guifont=Menlo\ 14

" -----------------------------------------------------------
" .md files are markdown files not modula2 ones
" http://stackoverflow.com/questions/23279292/
" -----------------------------------------------------------
autocmd BufNewFile,BufRead *.md set filetype=markdown

" -----------------------------------------------------------
" color correction for herald and git-gutter
" -----------------------------------------------------------
" hi clear LineNr
" hi SignColumn guibg=#1F1F1F
" hi GitGutterAdd guibg=#1F1F1F guifg=green
" hi GitGutterChange guibg=#1F1F1F guifg=purple
" hi GitGutterDelete guibg=#1F1F1F guifg=red
" hi GitGutterChangeDelete guibg=#1F1F1F guifg=red

" -----------------------------------------------------------
" vim-tex-fold
" -----------------------------------------------------------
let g:tex_fold_additional_envs = ['abstract']

" -----------------------------------------------------------
" vim-markdown
" -----------------------------------------------------------
let g:vim_markdown_frontmatter=1

" -----------------------------------------------------------
" YouCompleteMe
" -----------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" -----------------------------------------------------------
" CtrlP
" -----------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bin/*,*/out/*
"let g:ctrlp_custom_ignore = '(bin|out)$'

" -----------------------------------------------------------
" automatically strip whitespaces on save. works with vim-better-whitespace
" https://github.com/ntpeters/vim-better-whitespace
" -----------------------------------------------------------
autocmd BufWritePre * StripWhitespace

" -----------------------------------------------------------
" Source the vimrc file after saving it
" -----------------------------------------------------------
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" -----------------------------------------------------------
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
" ----------------------------------------------------------0
nnoremap <C-S-J> <C-W><C-J>
nnoremap <C-S-K> <C-W><C-K>
nnoremap <C-S-L> <C-W><C-L>
nnoremap <C-S-H> <C-W><C-H>
set splitbelow
set splitright

" -----------------------------------------------------------
" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
" -----------------------------------------------------------
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" -----------------------------------------------------------
" resolve ycm and ultisnips compatibility http://stackoverflow.com/a/22253548/317212
" -----------------------------------------------------------

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" -----------------------------------------------------------
"  resolve incompatibility between snipmate and ycm
" -----------------------------------------------------------
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-space>"
" let g:UltiSnipsJumpForwardTrigger="<c-space>"
" let g:UltiSnipsJumpBackwardTrigger="<c-s-space>"

" ---------------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------------
"let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#syntastic#enabled = 1

let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_right_sep = ' '

