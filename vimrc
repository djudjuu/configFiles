	" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by " the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible		"required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"PLUGINS:
"CODE FOLDING
Plugin 'tmhedberg/SimpylFold'	"code folding
let g:SimpylFold_fold_docstring = 0	" see docstrings of folded code
let g:SimpylFold_fold_import = 0 	" imports not folded
"for some issues to work properly:
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Powerline :
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"Nerdtree to navigate files
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore pyc files in NERDTree
map <F4> :NERDTreeToggle<CR>

"search files and everything:
Plugin 'kien/ctrlp.vim'

"Python intendation:
Plugin 'vim-scripts/indentpython.vim'

"autocompletion
Bundle 'Valloric/YouCompleteMe'

"syntax checking and highlightingA
Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"colorschemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
"Plugin 'tstelzer/welpe'
"
" Latexcoding
Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Enable folding
"set foldmethod=manual
set foldlevel=99


"syntaxble folding with the spacebar
nnoremap <space> za 

"syntax checking and highlightingA
let python_highlight_all=1
syntax on
"colorscheme logic:
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
"switc between dark and light with F5
call togglebg#map("<F5>")

"copy pasting from system clipboard
"Aset clipboard = unnamedplus NOT WORKING need to install vim with another
"packet see:
"ihttp://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard

"save cursor position and folds when writing and closing
set viewoptions=cursor,folds,slash,unix 
let g:skipview_files = ['*\.vim'] 

"save and load view automatically
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 


"LATEX STUFF
""vimtex folding by sections 
let g:vimtex_fold_enabled=1

"bugfix because citations are not added
:let g:vimtex_complete_recursive_bib = 1 "not working
"let s:re_bibs  = '''' . s:nocomment
"let s:re_bibs .= '\\(bibliography|add(bibresource|globalbib|sectionbib))'
"let s:re_bibs .= '\m\s*{\zs[^}]\+\ze}'''
"set foldmethod=manual
"
"this sets to indent and enables manual folding afterwards
"augroup vimrc
	"au BufReadPre * setlocal foldmethod=indent
	"au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
" move between split windows with control + vim movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"python intendation and no lines longer than 80:
au BufNewFile,BufRead *.py
    \set tabstop=5
    \set softtabstop=5
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

set encoding=utf-8
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set nu			 " shows line numbers

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

"Esc with df jk or jj
"imap df <Esc>
imap jk <Esc>
imap jj <Esc>

set cursorline          " highlight current line
set wildmenu 		" visual autocomplete for command menu

let mapleader = "\<Space>"
nnoremap <Leader>d :YcmCompleter GetDoc <CR>
nnoremap <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"open last open tab
nmap <c-t> :vs<bar>:b#<CR>



"completion for latexfiles

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
        \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
        \ 're!\\hyperref\[[^]]*',
        \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
        \ 're!\\(include(only)?|input){[^}]*',
        \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
        \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
        \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
        \ ]
<
"set foldmet
"flagging unnecessary whitespace (not working)
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"##################### MY OLD STUFF #####################

" line enables syntax highlighting by default.
"if has("syntax")
  "syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
""  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
  "source /etc/vim/vimrc.local
"endif

" Here is what I found from this site http://dougblack.io/words/a-good-vimrc.html#movement


"highlight Normal ctermbg=white ctermfg = black
"syntax on
"set background=dark
"colorscheme badwolf 	" awesome colorscheme		
"colorscheme solarized " also nice

	

"nnoremap <F5> :GundoToggle<CR> " open an undo tree

" save session
"nnoremap <leader>s :mksession<CR>noremap 

"execute pathogen#infect()
