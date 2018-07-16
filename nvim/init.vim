" Fix vim with fish  {{{
if &shell =~# 'fish$'
    set shell=sh
endif
" }}}

" Fix Terminal enter/exit {{{
tnoremap <silent> <C-up> <C-\><C-n><C-w><up>
tnoremap <silent> <C-down> <C-\><C-n><C-w><down>
tnoremap <silent> <C-left> <C-\><C-n><C-w><left>
tnoremap <silent> <C-right> <C-\><C-n><C-w><right>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
" }}}

" Plug setup  {{{
call plug#begin('~/.vim/plugged')
"}}}

" Plugs  {{{
" Base
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'teranex/jk-jumps.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'milkypostman/vim-togglelist'
Plug 'ton/vim-bufsurf'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'sjl/vitality.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'metakirby5/codi.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'alvan/vim-closetag'
Plug 'edkolev/tmuxline.vim'
Plug 'derekstavis/yanklight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Support
Plug 'tpope/vim-dispatch'
Plug 'embear/vim-localvimrc'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'Shougo/vimproc.vim'
Plug 'w0rp/ale'

" Colorschemes
Plug 'morhetz/gruvbox'

" Languages
Plug 'b4winckler/vim-objc'
Plug 'rodjek/vim-puppet'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'gkz/vim-ls'
Plug 'kchmck/vim-coffee-script'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-vaultproject'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ekalinin/Dockerfile.vim'
Plug 'digitaltoad/vim-pug'
Plug 'osyo-manga/vim-monster'
Plug 'zchee/deoplete-jedi'
Plug 'uarun/vim-protobuf'
Plug 'CyCoreSystems/vim-cisco-ios'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'neovimhaskell/haskell-vim'
Plug 'elmcast/elm-vim'
Plug 'rgrinberg/vim-ocaml'

" JS Beautify
Plug 'michalliu/jsruntime.vim'
Plug 'michalliu/jsoncodecs.vim'

" Omnicompletion
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'tweekmonster/deoplete-clang2'
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'awetzel/elixir.nvim', { 'for': 'exs' }
Plug 'zchee/deoplete-clang'

" Search
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'

" Git
Plug 'tpope/vim-fugitive'
" }}}
" Plug post-setup {{{
call plug#end()
" }}}
" Basic options  {{{
set mouse=a
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11

autocmd VimEnter * NERDTree
" NeoVim Options
" Display incomplete commands.
set noshowcmd
" Display the mode you're in.
set showmode

" Intuitive backspacing.
set backspace=indent,eol,start
" Handle multiple buffers better.
set hidden

" Enhanced command line completion.
set wildmenu

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" Show line numbers.
set number
" Show cursor position.
set ruler
" Highlight ruler at colum 72.
set colorcolumn=72
" Highlight current line
set cursorline

" Highlight matches as you type.
set incsearch
" Don't highlight matches.
set nohlsearch

" Turn off line wrapping.
set nowrap
" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title
" Set terminal's title to filename
set titlestring=%t

" Don't blink screen on stuff
set novb

" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup
" Keep swap files in one location
set directory=$HOME/.config/nvim/tmp//,.

" Global tab width.
set tabstop=2
" And again, related.
set shiftwidth=2
" And also expand tabs.
set expandtab

" Files open expanded
set foldlevelstart=50
" Use decent folding
set foldmethod=indent

" Show the status line all the time
set laststatus=2
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Always diff using vertical mode
set diffopt+=vertical

" Automatically reads changed files
set autoread

" Enable syntax highlighting
syntax enable

" Use a better separator for splits
set fillchars+=vert:│

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set termguicolors
set background=dark
colorscheme gruvbox

" Leader = ,
let mapleader = ","
let maplocalleader = "'"

" Open preview window below the code
set splitbelow

" Remove 'press any key to continue'
set cmdheight=1

" Disable fucked-up SQL completion
let g:omni_sql_no_default_maps = 1

" Completion
set completeopt=menu,noselect

let g:airline#extensions#ale#enabled = 1

" Live replacement
if exists("&inccommand")
  set inccommand=split
endif

autocmd FileType nerdtree setlocal nolist

" }}}
" General mappings  {{{
" Tabs {{{
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>e :tabedit
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>
" }}}
" IDE Like {{{
nmap <leader>2 :NERDTreeToggle<CR>
nmap <leader>1 :TagbarToggle<CR>
let NERDTreeShowHidden=1
" }}}
" Line movement {{{
" Go to start of line with H and to the end with $
noremap H ^
noremap L $

" Emacs bindings in command-line mode
cnoremap <C-A> <home>
cnoremap <C-E> <end>
" }}}
" Folding {{{
" Toggles folding with space
nnoremap <Space> za
" Open all folds
nnoremap zO zR
" Close all folds
nnoremap zC zM
" Close current fold
nnoremap zc zc
" Close all folds except the current one
nnoremap zf mzzMzvzz
" }}}
" Search {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}
" Spell {{{
set spelllang=en_us

nnoremap ,sc :set spell!<cr>
" }}}
" Misc {{{
" Edit and load vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap current paragraph
noremap <leader>w gqap

" Toggles hlsearch
nnoremap <leader>hs :set hlsearch!<cr>

" Maps <C-C> to <esc>
noremap <C-C> <esc>

" Go full-screen
nnoremap <leader>fs :set lines=999 columns=9999<cr>

" Set current file executable
nnoremap <leader>xx :!chmod +x %<cr>

" Close Quickfix and Preview
nnoremap <leader>q :pclose<cr>:cclose<cr>

" Resize Panels with Shift
nnoremap <S-Down> <c-w>+
nnoremap <S-Up> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" Fix tmux navigation
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Navigate splits
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j
" }}}
" }}}
" Plugin settings  {{{
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
" NERDTree  {{{
noremap <leader>ft :NERDTreeToggle<CR>

" Don't fuck up vim's default file browser
let g:NERDTreeHijackNetrw = 0
let NERDTreeMapActivateNode='<space>'
let NERDTreeShowHidden=1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}
" Airline  {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
let g:airline_section_warning = ''
let g:airline_inactive_collapse = 0
let g:airline#extensions#default#section_truncate_width = {
  \ 'a': 60,
  \ 'b': 80,
  \ 'x': 100,
  \ 'y': 100,
  \ 'z': 60,
\ }
" }}}
" FZF  {{{
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" nnoremap <C-P> :Files<cr>
nnoremap <C-F> :Ag
nnoremap <C-B> :Buffers<cr>
" }}}
" Yankstack  {{{
" Don't use default mappings
let g:yankstack_map_keys = 0

" Set bindings
nmap <C-M> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste
" }}}
" Number toggle  {{{
let g:NumberToggleTrigger="<leader>ll"
"}}}
" Javascript JSX {{{
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"}}}
" togglelist {{{
let g:toggle_list_copen_command="Copen"
" }}}
" localvimrc {{{
let g:localvimrc_whitelist=$HOME.'/Documents'
let g:localvimrc_persistent=1
" }}}
" editorconfig {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}
" Syntastic {{{
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_balloons = 0
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}
" deoplete-go {{{
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
" }}}
" Multiple cursors {{{
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

function! g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction

function! g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction
" }}}
" Filetype-specific  {{{
" Markdown  {{{
" Sets markdown syntax for *.md files.
autocmd BufRead,BufNewFile *.md,*.markdown set filetype=ghmarkdown

" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap
" }}}
" JavaScript  {{{

autocmd BufRead,BufNewFile *.js set shiftwidth=2
autocmd BufRead,BufNewFile *.js set expandtab

" Sets javascript syntax for *.json files.
autocmd BufRead,BufNewFile *.json set filetype=javascript

" Sets html syntax for *.ejs files.
autocmd BufRead,BufNewFile *.ejs set filetype=html

" Sets JSX syntax for all .js files
let g:jsx_ext_required = 0
" }}}
" Vim {{{
" Make vimrcs open folded
autocmd FileType vim set foldlevel=0
autocmd FileType vim set foldmethod=marker
" }}}
" XML {{{
" Automatically format XML files
nnoremap <leader>xb :%s,>[ <tab>]*<,>\r<,g<cr> gg=G
" }}}
" YAML {{{
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set tabstop=2
" }}}
" Elixir {{{
autocmd BufRead,BufNewFile *.ex set filetype=elixir
autocmd BufRead,BufNewFile *.exs set filetype=elixir
autocmd FileType elixir set shiftwidth=2
autocmd FileType elixir set tabstop=2
" }}}
" Go {{{
autocmd FileType go set foldmethod=syntax

autocmd FileType go let g:go_highlight_functions = 1
autocmd FileType go let g:go_highlight_methods = 1
autocmd FileType go let g:go_highlight_fields = 1
autocmd FileType go let g:go_highlight_types = 1
autocmd FileType go let g:go_highlight_operators = 1
autocmd FileType go let g:go_highlight_build_constraints = 1
" }}}
" Fish {{{
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr
" }}}
" }}}
