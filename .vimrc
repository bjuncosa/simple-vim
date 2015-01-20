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
" autocomplete
""""""""""""""""""""""""""""""
Bundle 'Shougo/neocomplete.vim'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"Bundle 'Shougo/neocomplcache.vim'
"let g:neocomplcache_enable_at_startup =1
""""""""""""""""""""""""""""""
" end autocomplete
""""""""""""""""""""""""""""""
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
" vim-json
" Map z and r to reset folding
autocmd FileType json map zr :syn sync fromstart<CR>
autocmd FileType json set foldmethod=syntax
autocmd FileType json set foldlevel=100
let g:vim_json_syntax_conceal = 0
""""""""""""""""""""""""""""""
" end json bundles
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Dockerfile
""""""""""""""""""""""""""""""
Plugin "ekalinin/Dockerfile.vim"
""""""""""""""""""""""""""""""
" end Dockerfile
""""""""""""""""""""""""""""""


" colors
Bundle 'altercation/vim-colors-solarized'

"Powerline
"Bundle 'Lokaltog/powerline'

" syntax check
Bundle 'scrooloose/syntastic'

" Autocomplete snippet
Bundle 'SirVer/ultisnips'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
"highlight ColorColumn ctermbg=232 guibg=232
set colorcolumn=80       " Print a line in column 80

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

let g:solarized_termcolors=256
" Set syntax on. Use a defined color schema found in .vim/colors/
if &t_Co >= 256 || has("gui_running")
  colorscheme solarized
endif

if &t_Co > 2 || has("gui_running")
  " switch syntax highlighting on, when the terminal has colors
  syntax on
endif
set background=dark

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has('autocmd')
  autocmd filetype html,xml set listchars-=tab:>.
endif

" Toggle paste mode on/off with <leader>p
set pastetoggle=<leader>p

" Enable mouse
"set clipboard=unnamedplus
"set mouse=a

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

let g:syntastic_puppet_checkers        = ['puppetlint']
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check'
let g:syntastic_python_checkers        = ['pylint']


""""""""""""""""""""""" Equal Align
let g:equalAlignEnabled = 1
nmap <leader>e :call ToggleEqualAlign()<CR>
function! ToggleEqualAlign()
  if g:equalAlignEnabled
    let g:equalAlignEnabled = 0
  else
    let g:equalAlignEnabled = 1
  endif
endfunction

inoremap <buffer> <silent> =<Space> =<Esc>:call <SID>equalalign()<CR>A
function! s:equalalign()
  if g:equalAlignEnabled
    let p                 = '^\s*\w+\s+[=]\s+[^=]*$'
    let lineContainsEqual = getline('.') =~# '^\s*\w+\s+[=]\s'
    let equalOnPrevLine   = getline(line('.') - 1) =~# p
    let equalOnNextLine   = getline(line('.') + 1) =~# p
    if exists(':Tabularize') " && lineContainsEqual && (equalOnPrevLine || equalOnNextLine)
        Tabularize /^[^=]*\zs=/l1
        normal! 0 1A
    else
        normal! 0 1A
    endif
  else
    normal! 0 1A
  endif
endfunction

