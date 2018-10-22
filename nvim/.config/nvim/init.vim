"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM SPECIFIC OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on
syntax enable
syntax on
set history=10000
set autoread
set autoindent
set smarttab
set backspace=indent,eol,start
" Make <C-A> and <C-X> only consider single alphabets, decimal and hexadecimal numbers
set nrformats-=octal
set hlsearch
set incsearch
set display+=lastline
set laststatus=2
" Remove comment leading character when joining two comment lines
set formatoptions=jcroql

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &encoding != "utf-8"
  set encoding=utf8
endif

let mapleader = ","
let g:mapleader = ","

nnoremap <Leader>w :w!<CR>
noremap <Leader>w!! :SudoWrite<CR>

" Persistent backup and recovery files
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/

if exists('*mkdir') && !isdirectory($HOME.'/.config/nvim/files')
  call mkdir($HOME.'/.config/nvim/files')
  call mkdir($HOME.'/.config/nvim/files/backup')
  call mkdir($HOME.'/.config/nvim/files/swap')
  call mkdir($HOME.'/.config/nvim/files/undo')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

set relativenumber
set number
set cursorline

" Smarter cursorline
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" By default wrap when a word ends
set wrap
set linebreak

" Toggle wrapping styles
noremap <F9> :call ToggleWrap()<CR>

" Show visual markers
set listchars=tab:»\ ,trail:·,extends:❯,precedes:❮,nbsp:·
set list
",eol:↲ or ¬ , tab: »·
set showbreak=↪\ \ \ 
set cpoptions+=n

set wildmenu
set wildignorecase
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

set showcmd
set ruler
set cmdheight=1

" Yank and paste from clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy
nnoremap <Leader>p "+p

set ignorecase
set smartcase

" Redraw and resync everything
nnoremap <Leader>ll :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><C-l>

set showmatch
set matchtime=1

set noerrorbells
set novisualbell

set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab " Insert tabs
set tabstop=4
set shiftwidth=4
autocmd BufWinEnter * :Yaifa

" Only add 1 space after punctuation when joining lines
set nojoinspaces

" For autoindent, use same spaces/tabs mix as previous line, even if tabs/spaces are mixed. Helps for docblock, where the block comments have a space after the indent to align asterisks
set copyindent

" Try not to change the indent structure on "<<" and ">>" commands. I.e. keep block comments aligned with space if there is a space there.
set preserveindent

" Break line into two lines if it crosses 120 characters (0 disables it)
set textwidth=0

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Be smart about lists by detecting various types of lists
setlocal formatlistpat=^\\s*[\\[({]\\\?\\([0-9]\\+\\\|[iIvVxXlLcCdDmM]\\+\\\|[a-zA-Z]\\)[\\]:.)}]\\s\\+\\\|^\\s*[-+o*]\\s\\+
set formatoptions+=n

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows, buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't lose visual selection after shifting
xnoremap < <gv
xnoremap > >gv

set hidden
set noshowmode
set pumheight=10

" Automatically resize panes on resize
autocmd VimResized * :wincmd =

set splitright
" Set winminheight/width to 0 to use <C-W>_ and <C-W>| optimally
set winminheight=0
set winminwidth=0

" Cylces through splits using a double press of enter in normal mode
nmap <Leader><CR> <C-w><C-w>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Switch between current and last buffer
nnoremap <Backspace> <C-^>

" Scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Moving up and down work as you would expect (Currently set to toggle with word wrap option
" nmap  <expr> <Leader>b  TYToggleBreakMove()
let g:gmove = "yes"
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> <Down> ScreenMovement("<Down>")
onoremap <silent> <expr> <Up> ScreenMovement("<Up>")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> <Down> ScreenMovement("<Down>")
nnoremap <silent> <expr> <Up> ScreenMovement("<Up>")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
vnoremap <silent> <expr> j ScreenMovement("j")
vnoremap <silent> <expr> k ScreenMovement("k")
vnoremap <silent> <expr> <Down> ScreenMovement("<Down>")
vnoremap <silent> <expr> <Up> ScreenMovement("<Up>")
vnoremap <silent> <expr> 0 ScreenMovement("0")
vnoremap <silent> <expr> ^ ScreenMovement("^")
vnoremap <silent> <expr> $ ScreenMovement("$")
vnoremap <silent> <expr> j ScreenMovement("j")

" Specify the behavior when switching between buffers and show tabline only if more than one tab is present
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=1
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ss will toggle and untoggle spell checking
noremap <Leader>ss :setlocal spell!<CR>

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
" Next misspelled word
noremap <Leader>sn ]s
" Previous misspelled word
noremap <Leader>sp [s
" Add word under cursor to dictionary
noremap <Leader>sa zg
" Suggest the correction
noremap <Leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map ; to :
"noremap : ;
"noremap ; :

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle line wrapping
function! ToggleWrap()
  if (&wrap == 1)
    if (&linebreak == 0)
      set linebreak
      let g:gmove=1
    else
      set nowrap
      let g:gmove=0
    endif
  else
    set wrap
    set nolinebreak
    let g:gmove=1
  endif
endfunction

function! ScreenMovement(movement)
  if &wrap && g:gmove == 'yes'
    return "g" . a:movement
  else
    return a:movement
  endif
endfunction

function! TYToggleBreakMove()
  if exists("g:gmove") && g:gmove == "yes"
    let g:gmove = "no"
  else
    let g:gmove = "yes"
  endif
endfunction

" VimAwesome.com search
function! VimAwesomeComplete() abort
  let prefix = matchstr(strpart(getline('.'), 0, col('.') - 1), '[.a-zA-Z0-9_/-]*$')
  echohl WarningMsg
  echo 'Downloading plugin list from VimAwesome'
  echohl None
ruby << EOF
  require 'json'
  require 'open-uri'

  query = VIM::evaluate('prefix').gsub('/', '%20')
  items = 1.upto(max_pages = 3).map do |page|
    Thread.new do
      url  = "http://vimawesome.com/api/plugins?page=#{page}&query=#{query}"
      data = open(url).read
      json = JSON.parse(data, symbolize_names: true)
      json[:plugins].map do |info|
        pair = info.values_at :github_owner, :github_repo_name
        next if pair.any? { |e| e.nil? || e.empty? }
        {word: pair.join('/'),
         menu: info[:category].to_s,
         info: info.values_at(:short_desc, :author).compact.join($/)}
      end.compact
    end
  end.each(&:join).map(&:value).inject(:+)
  VIM::command("let cands = #{JSON.dump items}")
EOF
  if !empty(cands)
    inoremap <buffer> <C-v> <C-n>
    augroup _VimAwesomeComplete
      autocmd!
      autocmd CursorMovedI,InsertLeave * iunmap <buffer> <C-v>
         \| autocmd! _VimAwesomeComplete
    augroup END

    call complete(col('.') - strchars(prefix), cands)
  endif
  return ''
endfunction

augroup VimAwesomeComplete
  autocmd!
  autocmd FileType vim inoremap <C-x><C-v> <C-r>=VimAwesomeComplete()<CR>
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable unused default plugins
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1

" Helper for coditional activation of plugins
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if has('nvim')
  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Code Completion
"""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'raimondi/delimitMate'                      " Insert mode autocompletion for quotes, parenthesis, brackets etc.
Plug 'SirVer/ultisnips'                          " Snippets for vim
Plug 'honza/vim-snippets'

" Golang
""""""""""""""""""""""""""""""""""""""""
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go'}

let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/cache'
set completeopt+=noinsert
set completeopt+=noselect

" Python
"""""""""""""""""""""""""""""""""""""""
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
let g:deoplete#sources#jedi#show_docstring=1
Plug 'fisadev/vim-isort', { 'do': 'pip install isort', 'for': 'python' }
Plug 'python-mode/python-mode', { 'for': 'python' }
let g:pymode_python = 'python3'
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
let g:SimpylFold_docstring_preview = 1

" Markup
"""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost note set filetype=markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }                   " Markdown syntax, matching rules and mappings
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }                         " Distraction free writing
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }                    " Focused markdown editing
Plug 'kannokanno/previm', { 'for': 'markdown' }
let g:previm_open_cmd = 'nightly'

" JSON
"""""""""""""""""""""""""""""""""""""""
Plug 'elzr/vim-json', { 'for': 'json' }                             " Syntax highlighting for JSON

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Color Schemes
"""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/AfterColors.vim'               " Colourscheme customization
Plug 'godlygeek/csapprox'                        " Makes Gvim colourschemes works in vim

Plug 'mhartington/oceanic-next'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Code Display
"""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/indentLine'             " Mark indents and leading spaces
"Plug 'nathanaelkane/vim-indent-guides' " Mark indent levels
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }               " Display tags ordered by scope
nnoremap <F8> :Tagbar<CR>
Plug 'ntpeters/vim-better-whitespace'  " Better whitespace highlighting
Plug 'junegunn/rainbow_parentheses.vim'

" Integrations
"""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-eunuch'                " Common unix commands from vim including SudoWrite
Plug 'tpope/vim-fugitive'              " Git commands from within vim
Plug 'tpope/vim-git'                   " Git runtime files for vim
Plug 'airblade/vim-gitgutter'          " Aynschronous git gutter
Plug 'jaxbot/github-issues.vim'        " GitHub issues from within vim
Plug 'rhysd/conflict-marker.vim'       " Highlight VCS conflict markers
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags' " Automatic tag generation
let g:easytags_async = 1
"Plug 'benekastah/neomake'              " Asynchronous make utility
"autocmd! BufWritePost * Neomake

Plug 'w0rp/ale'
let g:ale_change_sign_column_color = 0
let g:ale_sign_warning = "--"
let g:ale_sign_error = "xx"
let g:ale_sign_info = "ii"
Plug 'wakatime/vim-wakatime'           " Wakatime integration

" Interface
"""""""""""""""""""""""""""""""""""""""
Plug 'itchyny/lightline.vim'           " Lightweight statusline
Plug 'ctrlpvim/ctrlp.vim'              " Fuzzy file, buffer, mru, tag finder

Plug 'rking/ag.vim'
nmap <Leader>& :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'scrooloose/nerdtree' " File browser with git status integration
Plug 'mhinz/vim-startify'              " Fancy start page
Plug 'kshenoy/vim-signature'           " Display, toggle and navigate marks

" Commands
"""""""""""""""""""""""""""""""""""""""
"Plug 'terryma/vim-multiple-cursors'    " Multi cursor support
Plug 'airblade/vim-rooter'             " Change to root directory (.git, project.json, etc.)
Plug 'scrooloose/nerdcommenter'        " Comment toggle
Plug 'haya14busa/incsearch.vim' " Highlight all pattern matches during an incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"Plug 'haya14busa/vim-asterisk'         " Plugin to not move on * search function
"Plug 'easymotion/vim-easymotion'       " Highlight the candidates of a motion for faster motions
Plug 'tpope/vim-surround'              " Surround text objects
Plug 'tpope/vim-repeat'                " Repeat any arbitrary command
Plug 'tpope/vim-abolish'               " Simplify the search, replace and abbreviation on multiple variants of a word
Plug 'tpope/vim-unimpaired'            " Pair style mappings
Plug 'junegunn/vim-easy-align'         " Text alignment
Plug 'raimondi/yaifa'                  " Indent finder
Plug 'terryma/vim-expand-region'       " Expand selection to a larger or smaller region
"Plug 'bronson/vim-visual-star-search'  " Start a * or # search from a visual block
Plug 'vim-scripts/matchit.zip'         " Extended % matching

" Text Objects
"""""""""""""""""""""""""""""""""""""""
"Plug 'wellle/targets.vim'
"Plug 'coderifous/textobj-word-column.vim'
"Plug 'kana/vim-textobj-fold'
"Plug 'kana/vim-operator-replace'
"Plug 'christoomey/vim-sort-motion'

"Plug 'michaeljsmith/vim-indent-object'
"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-function'
"Plug 'kana/vim-textobj-entire'
"Plug 'kana/vim-textobj-line'
"Plug 'mattn/vim-textobj-url'
"Plug 'Julian/vim-textobj-brace'
"Plug 'rhysd/vim-textobj-continuous-line'
"Plug 'libclang-vim/vim-textobj-clang'
"Plug 'bps/vim-textobj-python'
"Plug 'jasonlong/vim-textobj-css'
"Plug 'rbonvall/vim-textobj-latex'
"Plug 'akiyan/vim-textobj-php'
"Plug 'nelstrom/vim-textobj-rubyblock'

call plug#end()

" Colourscheme
set background=dark
" Full colour baby (Comment this to allow rainbow parentheses to work)
"set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" Unmap leader hogging insert mode mappings
augroup DisableMappings
  autocmd!
  autocmd VimEnter * :inoremap <Leader>ih <Nop>
  autocmd VimEnter * :inoremap <Leader>is <Nop>
  autocmd VimEnter * :inoremap <Leader>ihn <Nop>
augroup END

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key

" deoplete config
let g:deoplete#enable_at_startup = 1
" disable autocomplete
let g:deoplete#disable_auto_complete = 0
if has("gui_running")
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif
" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

nmap <C-P> <Plug>(ctrlp)

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]
au VimEnter * RainbowParentheses

augroup php
  au FileType php :let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
  au FileType php :RainbowParentheses!
augroup END

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <Leader>a :cclose<CR>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 0
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

" Open :GoDeclsDir with ctrl-g
nmap <leader><C-g> :GoDeclsDir<cr>
imap <leader><C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run-split)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  autocmd Filetype go nmap <Backspace> :A<CR>
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ }
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

let g:limelight_conceal_ctermfg = 8
