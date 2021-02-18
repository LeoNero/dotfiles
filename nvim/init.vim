" Fix vim with fish  {{{
if &shell =~# 'fish$'
    set shell=sh
endif
" }}}


" ==== Plug {{{{
call plug#begin('~/.config/nvim/plugged')

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Linter
Plug 'dense-analysis/ale'

" Find and replace
Plug 'brooth/far.vim'
Plug 'tpope/vim-abolish'

" Search
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'

" Moving and search
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Formatting
Plug 'Yggdroot/indentLine'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Folding Code
Plug 'tmhedberg/SimpylFold'

" Import and variable optimization (python)
Plug 'tell-k/vim-autoflake'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Syntax helpers
Plug 'scrooloose/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'klen/pylama'
Plug 'Raimondi/delimitMate'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
Plug 'luochen1990/rainbow'

" Languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'dag/vim-fish'
Plug 'ocaml/vim-ocaml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jtratner/vim-flavored-markdown'
Plug 'rust-lang/rust.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomlion/vim-solidity'
Plug 'vim-ruby/vim-ruby'
Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rescript-lang/vim-rescript'
Plug 'kevinoid/vim-jsonc'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Language pack
Plug 'sheerun/vim-polyglot'

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

" Window swap
Plug 'https://github.com/wesQ3/vim-windowswap'

" Other
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'metakirby5/codi.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-eunuch'
Plug 'maxbrunsfeld/vim-yankstack'

call plug#end()
" }}}}


" ==== Basic config {{{{

" Arrows are unvimlike {{{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}}

" Undo (set undo folder, file, and level) {{{{
" set undodir=~/.config/nvim/undodir
" set undofile
" set undolevels=1000
" set undoreload=10000
" }}}}

" Set tab and shift, and convert tab to space {{{{
set tabstop=4
set shiftwidth=4
set expandtab
" }}}}

" Line number {{{{
" Show line number
set number

" Set size of width of column where it appears
set numberwidth=2

" Set number line to be relative to current line {{{{
set number relativenumber
" }}}}

" Search {{{{
" Do not highlight all search results
set nohlsearch
" Start highlight of search while typing
set incsearch

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase
"}}}}

" Make scroll happen only inside vim {{{{
set mouse=a
" }}}}

" Change key for leaving insert mode to jk {{{{
inoremap <Esc> <nop>
nnoremap <Esc> <nop>
vnoremap <Esc> <nop>
inoremap jk <Esc>
" }}}}

" Change leader key to Space {{{{
let mapleader = " "
" }}}}

" Change localleader key to , {{{{
let maplocalleader = "\\"
" }}}}

" File configuration {{{{
set encoding=utf-8
" }}}}

" Make vimbuffer the same as your computer {{{{
set clipboard=unnamedplus
" }}}}

" Spell configuration {{{{
set spell spelllang=en_us
set nospell
nnoremap <leader>f 1z=
nnoremap <leader>sc :set spell!<CR>
" }}}}

" Display incomplete commands {{{{
set noshowcmd
" }}}}

" Intuitive backspacing {{{{
set backspace=indent,eol,start
" }}}}

" Colorscheme {{{{
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors     " enable true colors support
colorscheme one
set background=dark
" }}}}

" Tabs {{{{
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>e :tabedit
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>
" }}}}

" Tagbar {{{{
nmap <leader>1 :TagbarToggle<CR>
" }}}}

" Handle multiple buffers better {{{{
set hidden
" }}}}

" Enhanced command line completion {{{{
set wildmenu
" }}}}

" Highlight ruler at colum 80 {{{{
set colorcolumn=80
" }}}}

" Highlight current line {{{{
set cursorline
" }}}}

" Turn off line wrapping {{{{
set nowrap
" }}}}

" Show 5 lines of context around the cursor {{{{
set scrolloff=5
" }}}}

" Title {{{{
" Set the terminal's title
set title

" Set terminal's title to filename
set titlestring=%t
" }}}}

" Backup {{{{
" Don't make a backup before overwriting a file
set nobackup
" And again
set nowritebackup
" Keep swap files in one location
set directory=$HOME/.config/nvim/tmp//,.
" }}}}

" Create splits {{{{
nnoremap <leader>s <c-w>s
nnoremap <leader>v <c-w>v
" }}}}

" Navigate splits {{{{
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j
" }}}}

" Open and source init.vim file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}}

" Folding {{{{
set foldlevelstart=50
set foldmethod=indent
" Toggles folding with comma
nnoremap , za
" Open all folds
nnoremap zO zR
" Close all folds
nnoremap zC zM
" Close current fold
nnoremap zc zc
" Close all folds except the current one
nnoremap zf mzzMzvzz
" }}}}

let g:python3_host_prog = '/usr/bin/python3'

" }}}}


" ==== Plugins config {{{{

" NERDTree {{{{
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1

nmap <leader>2 :NERDTreeToggle<CR>

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeGitStatusUseNerdFonts = 1
" }}}}

" airline {{{{
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'one'
let g:airline_section_warning = ''
let g:airline_inactive_collapse = 0
let g:airline#extensions#default#section_truncate_width = {
  \ 'a': 60,
  \ 'b': 80,
  \ 'x': 100,
  \ 'y': 100,
  \ 'z': 60,
\ }
" }}}}

" ale {{{{
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_linters_explicit = 0
let g:ale_sign_column_always = 1
" }}}}

" ag and ack {{{{
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}}

" SimplyFold {{{{
let g:SimpylFold_docstring_preview = 1
" }}}}

" ctrlp {{{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}}

" rainbow {{{{
let g:rainbow_active = 1
" }}}}

" NERD Commenter {{{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}}}

" Fugitive  {{{
" (thanks to Steve Losh's vimrc)
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gm :Gmove
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gp :Git push
" }}}


" ==== File specific {{{{

" Javascript {{{{
augroup filetype_javascript
    autocmd!
    autocmd BufRead,BufNewFile *.js,*.json setlocal tabstop=2
    autocmd BufRead,BufNewFile *.js,*.json setlocal shiftwidth=2
    autocmd FileType javascript setlocal formatprg=prettier\ --stdin
    autocmd FileType javascript nnoremap <buffer> <localleader>/ I//<space><esc>j$
augroup END
" }}}}

" Typescript {{{{
augroup filetype_typescript
    autocmd!
    autocmd BufRead,BufNewFile *.ts setlocal tabstop=2
    autocmd BufRead,BufNewFile *.ts setlocal shiftwidth=2
    autocmd FileType typescript nnoremap <buffer> <localleader>/ I//<space><esc>j$
augroup END
" }}}}

" Markdown
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
    autocmd BufRead,BufNewFile *.md setlocal wrap
augroup END
" }}}}

" Makefile {{{
    autocmd BufNewFile,BufRead Makefile setlocal noexpandtab
" }}}

" Rust {{{
let g:rustfmt_autosave = 1
" }}}

" }}}}
