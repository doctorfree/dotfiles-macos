execute pathogen#infect()
set nocompatible
set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
if has('mouse')
  set mouse=a
endif
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
colorscheme darkspectrum
set guifont=Inconsolata:h18
let g:syntastic_javascript_checkers = []

"set mediawiki_editor_url=wiki.ecld.io
"set mediawiki_editor_path=/wiki/
"set mediawiki_editor_domain=cas.ecld.io
"set mediawiki_editor_username=rrecord
"set mediawiki_basicauth_enabled=off
"set mediawiki_basicauth_username=rrecord
