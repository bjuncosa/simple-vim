" This must be first, beacause it changes other options as side effect
set nocompatible
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
Bundle 'scrooloose/nerdtree'

""""""""""""""""""""""""""""""
" puppet bundles
""""""""""""""""""""""""""""""
Bundle 'rodjek/vim-puppet'
" required by vim-puppet to autoindent =>
Bundle 'godlygeek/tabular'
""""""""""""""""""""""""""""""
" end puppet bundles
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" json bundles
""""""""""""""""""""""""""""""
Bundle 'elzr/vim-json'
""""""""""""""""""""""""""""""
" end json bundles
""""""""""""""""""""""""""""""

" syntax check
Bundle 'scrooloose/syntastic'

filetype plugin indent on     " required!

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
execute pathogen#infect()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Keep buffers when editing another file
set hidden

set expandtab     " Always use spaces instead of using tab
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Do not write backup files when editing a file
set nobackup
set noswapfile

" Let vim detect the filetype you are editing.
" This enables it to enable plugins only when needed
filetype plugin indent on

" Set specific settings depending on filetype this way
if has('autocmd')
  autocmd filetype python set expandtab tabstop=4 shiftwidth=4
  autocmd filetype puppet set expandtab tabstop=2 shiftwidth=2
endif

" Set syntax on. Use a defined color schema found in .vim/colors/
if &t_Co >= 256 || has("gui_running")
  colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
  " switch syntax highlighting on, when the terminal has colors
  syntax on
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has('autocmd')
  autocmd filetype html,xml set listchars-=tab:>.
endif

" Toggle paste mode on/off with <leader>p
set pastetoggle=<leader>p

" Enable mous
set mouse=a

set number        " always show line numbers

" Toggle number on/off using <C-n>
nmap <C-n> :set number!<CR>

" Create new tab using <C-t>
nmap <C-t> :NewTab<CR>

" Save a file you need sudo without retyping it using w!!
cmap w!! w !sudo tee % >/dev/null

" Toggle NerdTree
map <C-e> :NERDTreeToggle<CR>

" Tab configure
map <C-l> :TagbarToggle<CR>
nmap <C-j> :tabprevious<CR>
nmap <C-k> :tabnext<CR>
nmap <C-t> :tabnew<CR>

