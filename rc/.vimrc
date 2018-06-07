set nocompatible     " Vi was good enough for Ken Thompson but not for you?
filetype off         " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vimwiki'
" Bundle 'cscope.vim'
Bundle 'Tagbar'
Bundle 'a.vim'
Bundle 'The-NERD-tree'
" Bundle 'Vitality'
" Bundle 'c-standard-functions-highlight'
" Bundle 'ctrlp.vim'
Bundle 'TagHighlight'
" Bundle 'EasyColour'
Bundle 'Solarized'
Bundle 'pyte'
Bundle 'vcscommand.vim'
Bundle 'fugitive.vim'
" Bundle 'mayansmoke'
Bundle 'candycode.vim'
Bundle 'blackdust.vim'
" Bundle 'industrial'
" Bundle 'native.vim'
filetype plugin indent on

syntax on            " Syntax Highlighting.
" colorscheme elflord  " Use Elflord Colors.
colorscheme muon
" colorscheme Solarized
" colorscheme slate
" colorscheme blackdust
" colorscheme native
" colorscheme murphy
" colorscheme evening

"if &diff
""  colorscheme pyte
"colorscheme elflord  " Use Elflord Colors.
"endif

" set spell

" set tabstop=4
" set shiftwidth=4

" Use the system clipboard for copy and paste.
" vnoremap y "*y
" vnoremap x "*x
" nnoremap y "*y
" nnoremap p "*p
" nnoremap d "*d
" nnoremap x "*x

set lazyredraw
set ttyfast

" A tab produces a 2-space indentation for LLVM
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

set hlsearch

set autoindent
set cindent
set smartindent

set colorcolumn=81
set autoread
set cursorline
set incsearch
set backspace=2                     " Allow backspace key.
set number                          " show line numbers
set ruler                           " show line, column position of cursor
set showmode
set showcmd                       " display incomplete commands
set showmatch                       " flash matching brackets during typing
set laststatus=2                    " always show status line, even if only one window is open

map <LocalLeader><right> :hide bn<CR>
map <LocalLeader><left>  :hide bp<CR>
map <LocalLeader><down>  :hide bd<CR>

map <LocalLeader>n :tn<CR>
map <LocalLeader>p :tp<CR>

map <LocalLeader>] :tn<CR>
map <LocalLeader>[ :tp<CR>

map <LocalLeader>m :make<CR>

map <LocalLeader>tt :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" set makeprg=~/bin/makews.sh

set mouse=a

set nobackup
set nowritebackup
set noswapfile

" " Quickly exit help file.
" autocmd BufRead *.txt if &buftype=='help'|nmap <buffer> q <C-w>c|endif
" 
" 
" cs add .
" 
" " The rest are LLVM specific vim configs:
" 
" " LLVM coding guidelines conformance for VIM
" " $Revision: 176235 $
" "
" " Maintainer: The LLVM Team, http://llvm.org
" " WARNING:    Read before you source in all these commands and macros!  Some
" "             of them may change VIM behavior that you depend on.
" "
" " You can run VIM with these settings without changing your current setup with:
" " $ vim -u /path/to/llvm/utils/vim/vimrc
" 
" " Highlight trailing whitespace and lines longer than 80 columns.
" highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
" highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
" if v:version >= 702
"   " Lines longer than 80 columns.
"   au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
" 
"   " Whitespace at the end of a line. This little dance suppresses
"   " whitespace that has just been typed.
"   au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
"   " au InsertEnter * call matchdelete(w:m1)
"   " au InsertLeave * call matchdelete(w:m2)
"   au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
"   au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
" else
"   au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
"   au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
"   au InsertLeave * syntax match WhitespaceEOL /\s\+$/
" endif
" 
" 
" " Enable filetype detection
" filetype on
" 
" " Optional
" " C/C++ programming helpers
" augroup csrc
"   au!
"   autocmd FileType *      set nocindent smartindent
"   autocmd FileType c,cpp  set cindent
" augroup END
" " Set a few indentation parameters. See the VIM help for cinoptions-values for
" " details.  These aren't absolute rules; they're just an approximation of
" " common style in LLVM source.
" set cinoptions=:0,g0,(0,Ws,l1
" " Add and delete spaces in increments of `shiftwidth' for tabs
" set smarttab
" 
" " LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" " so it's important to categorize them as such.
" augroup filetype
"   au! BufRead,BufNewFile *Makefile* set filetype=make
" augroup END
" 
" " In Makefiles, don't expand tabs to spaces, since we need the actual tabs
" autocmd FileType make set noexpandtab
" 
" " Useful macros for cleaning up code to conform to LLVM coding guidelines
" 
" " Delete trailing whitespace and tabs at the end of each line
" command! DeleteTrailingWs :%s/\s\+$//
" 
" " Convert all tab characters to two spaces
" command! Untab :%s/\t/  /g

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
 au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END

au bufreadpre,bufnewfile *.bnf set ft=bnf

set clipboard=unnamed

map <C-K> :pyf ~/Projects/llvm_proj/tools/clang/tools/clang-format/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/Projects/llvm_proj/tools/clang/tools/clang-format/clang-format.py<cr>

