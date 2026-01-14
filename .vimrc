" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" don't keep a backup file, use versions instead
set nowritebackup	" don't backup before overwriting
if has("vms")
else
  " Check if persistent undo is supported by your Vim version
  if has('persistent_undo')
      " Enable persistent undo
      set undofile

      " Specify the directory to store undo files
      " You can choose any directory, but a common practice is
      " to create a dedicated directory within your .vim folder
      let &undodir = expand('~/.vim/undodir')

      " Create the undodir if it doesn't exist
      if !isdirectory(&undodir)
          call mkdir(&undodir, 'p')
      endif
  endif

endif

set noswapfile
"set backupdir=$HOME/_backup,.
"set directory=$HOME/_swap,.

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set guifont=Courier_New:h12:cANSI
set laststatus=2
set statusline=
set statusline +=[%M]\                              "modified flag
set statusline +=[%{strlen(&fenc)?&fenc:'none'}\ :\ %{&ff}]\   "file encoding
set statusline +=%<%F\                              "full path
set statusline +=%=                                 "section separator
set statusline +=buf\ [%n]\                           "buffer number
set statusline +=[line\ %l\/%L,                     "current line
set statusline +=\ col\ %v\/%{virtcol('$')-1}]\                        "virtual column number
set statusline +=%p%%                               "percentage through the file

" ###### Extra options added by Arcane - Start ######
if has ('unix')
    language messages C
else
    language messages en_US.UTF-8
endif

" Set editor supplementary info for coding
set showmode " display the operation mode in the bottom
set number " display the line number

" Set Auto-indent style
set tabstop=4 " set tabstop postion as 4 space
set shiftwidth=4 " set the number of space inserted for indentation
set expandtab " use space to replace tab
set langmenu=en_US.UTF-8 " set GUI language menu locale to English to avoide BIG5 scramble issue in Chinese Windows
set encoding=UTF-8

" if set isfname+=32 is set, path auto completion in :! is not working
" if not set, gx will got problem when the path contains space
" set isfname+=32

colorscheme torte

