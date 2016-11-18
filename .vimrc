set path+=**
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'"
"Plugin 'salsifis/vim-Transpose'
"Plugin 'itchyny/dictionary.vim'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
"Bundle 'altercation/vim-colors-solarized.git'
"Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/tomorrow-theme'
Bundle 'mhinz/vim-startify'
"Bundle 'gerw/vim-latex-suite'
"Plugin 'xuhdev/vim-latex-live-preview'
"Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-surround.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-voom/VOom'
Plugin 'junegunn/vim-easy-align'
Plugin 'chrisbra/csv.vim'

"Plugin 'ivanov/vim-ipython'
"Plugin 'Yggdroot/indentLine' <-- kills performance in big files (only testedin latex)
Bundle 'vim-scripts/AutoComplPop'
"Bundle 'xolox/vim-easytags'
"Bundle 'xolox/vim-misc'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
"----------------------------------------
filetype on

"-----behaviour-----
"-- copy from and to clipboard
set clipboard=unnamed
set clipboard=unnamedplus
set diffexpr=MyDiff()
"-- search
set ignorecase
set smartcase 
set incsearch
set hlsearch
"-- ctrl-h is backspace
set backspace=2
imap ^H <BS>

"-----visuals------
"set guifont=Lucida_Console:h9
set guifont=Hack
syntax enable
set background=dark
"colorscheme solarized
colorscheme Tomorrow-Night-Bright

set number
set guioptions-=T  "remove toolbar in gvim

"---- encodings ---
"-- should be set manually in file header
set modeline
set modelines=5
set encoding=utf-8

"---------Autocomplete
"set complete = "."
"w,b,u,t,i
".: The current buffer
"w: Buffers in other windows
"b: Other loaded buffers
"u: Unloaded buffers
"t: Tags
"i: Included files

"---- tab behaviour -----
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" disable automatic line breaks 
set wrap linebreak nolist
set fo-=t
set tw=0
set textwidth=0

"-- Thesaurus
"set thesaurus+=$VIM\vimfiles\Thesaurus\openthesaurus.txt

"--- startify

let g:startify_custom_footer =
      \ ['', "   ..Du bist am Ende..    ", '']

"note for header: repeat any single ' in ascii-art
let g:startify_custom_header = [
            \ '           _                ___       _.--.      ',                 
            \ '           \`.|\..----...-''`   `-._.-''_.-''`      ',                 
            \ '           /  '' `         ,       _.-''         ',                 
            \ '           )/'' _/     \   `-_,   /               ',
            \ '           `-''" `"\_  ,_.-;_.-\_ '',              ',                 
            \ '               _.-''_./   {_.''   ; /              ',
            \ '              {_.-``-''         {_/               ',                 
            \'',
            \ ]

let g:ctrlp_reuse_window = 'startify'

"---- spelling ----
set spelllang=de,en
"set spell

"--- airline ----

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

"let g:airline_left_sep='>'
"let g:airline_right_sep='<'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=1
let g:airline_inactive_collapse=1

set laststatus=2
let g:bufferline_echo = 0
set noshowmode

set lazyredraw

"---- Easy Motion-----
let mapleader="\<Space>"

"--- vim-latex-live-preview
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:livepreview_previewer = 'evince'

"--- file browse 
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

"--pandoc
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#filetypes#pandoc_markdown = 0
augroup pandoc_syntax
    au! BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
augroup END
