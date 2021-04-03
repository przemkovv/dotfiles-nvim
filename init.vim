
call plug#begin(stdpath('config'). '/plugged')
Plug 'romainl/apprentice'
Plug 'chriskempson/base16-vim'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
"Plug 'jackguo380/vim-lsp-cxx-highlight'

" File navigation {{{
"
if has("win32")
  Plug 'junegunn/fzf', { 'dir': 'h:/dev/tools/fzf', 'do': './install --all' }
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/FSwitch'
" }}}


let g:nremap = {'<p': '', '>p': '', '<P': '', '>P':''}
Plug 'tpope/vim-unimpaired'

Plug 'ciaranm/securemodelines'
Plug 'embear/vim-localvimrc'
Plug 'mhinz/vim-signify'

Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'chrisbra/unicode.vim'
Plug 'sbdchd/neoformat'

" Status bar {{{
Plug 'vim-airline/vim-airline'
" }}}


" Text Objects {{{
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function' " af, if, aF, iF
Plug 'kana/vim-textobj-fold' " az, iz
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}
Plug 'junegunn/vim-easy-align'
" }}}
"
"
" Filetype specific {{{
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp'}
Plug 'vim-jp/vim-cpp', { 'for': 'cpp'}
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'wannesm/wmgraphviz.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv'}  " A Filetype plugin for csv files

" HTML/CSS/Javascript/Typescript {{{
Plug 'tpope/vim-ragtag', { 'for': 'html'}
Plug 'othree/html5.vim', { 'for': 'html'}

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" }}}
" }}}

call plug#end()


silent! colorscheme evening
silent! colorscheme base16-chalk
silent! colorscheme apprentice

" {{{
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set tabstop=4
set shiftwidth=2
set expandtab
set softtabstop=2

set number
set numberwidth=5
set relativenumber
set nocursorline

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

" Number line settings {{{
" --------------------------------------------------------------------------------
augroup NumberLines
  autocmd!
  autocmd FocusLost * set norelativenumber
  autocmd WinLeave * set norelativenumber
  autocmd InsertEnter * set norelativenumber

  autocmd FocusGained * set relativenumber
  autocmd WinEnter * set relativenumber
  autocmd InsertLeave * set relativenumber
augroup END
if exists('&inccommand')
  set inccommand=nosplit
endif

set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes) in terminals
set hlsearch      " highlight search terms
set history=10000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.d,*.o     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=*.doc,*.docx,*.pdf,*.ppt,*.pptx,*.xls,*.wmv  " Windows
set wildignore+=*.bbl,*.synctex.gz,*.blg,*.aux
set wildignore+=*\\vendor\\**
set wildignore+=*/vendor/**
set wildignorecase
set wildmode=longest,full
" set wildmode=list:longest,full
set title
set undofile
set showmode
if has("nvim")
  set wildoptions+=pum
  "set pumblend=10
endif
set wildmenu
set laststatus=2
set scrolloff=5 " Keep 5 lines (top/bottom)
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set sidescrolloff=5 " Keep 5 lines at the size
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set report=0


set list listchars=trail:•,tab:»·

set splitright
set splitbelow

set breakindent
set breakindentopt+=sbr

set tags=tags,./tags,~/.vimtags
set completeopt=menu,preview,noselect,menuone

set cmdheight=2

set notimeout ttimeout ttimeoutlen=200

set nostartofline

" }}}


"===============================================================================
" Command-line Mode Key Mappings
"===============================================================================

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Ctrl-[hl]: Move left/right by word
cnoremap <c-h> <s-left>
cnoremap <c-l> <s-right>

" Ctrl-space: Show history
cnoremap <c-@> <c-f>

cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

nnoremap <Space>sv :source $MYVIMRC<CR>
nnoremap <Space>ev :e  $MYVIMRC<CR>
nnoremap <Space>eev :vsplit  $MYVIMRC<CR>
nnoremap <Space>l :s/\.\ /\.\r/g<CR>:nohl<CR>
nnoremap <silent> <C-L> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:sign unplace *<cr><c-l>

nnoremap <Space>= :keepjumps normal mzgg=Gg`zzz<CR>
"===============================================================================
" Insert Mode Ctrl Key Mappings
"===============================================================================
" Ctrl-w: Delete previous word, create undo point
inoremap <c-w> <c-g>u<c-w>

" Ctrl-u: Delete til beginning of line, create undo point
inoremap <c-u> <c-g>u<c-u>

nnoremap n nzzzv
nnoremap N Nzzzv


" Filetype-specific ------------------------------------------------------- {{{

" QuickFix {{{

augroup ft_quickfix
  autocmd!
  autocmd FileType qf wincmd J
  autocmd FileType qf resize 10
  autocmd Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END
" }}}
" Vim {{{
augroup ft_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType help setlocal textwidth=78
  autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" }}}
"

" nvim-lsp {{{

if has("nvim")
  " This is optional, but you may find it useful
  autocmd CompleteDone * pclose
  "lua require 'lspconfig'.
  "lua require('lsp_settings').cpp()
  "lua require('lsp_settings').rust()
  "lua require('lsp_settings').python()
  "lua require('lsp_settings').viml()

  nnoremap <silent> <space>dc    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <space>gd    <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gd           <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K            <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <space>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <space>k     <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <space>gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> <space>gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> <space>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
endif

" }}}


" fzf {{{
"
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 0
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
"let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore --follow --glob "!.git/*" '
let $FZF_DEFAULT_OPTS='--layout=reverse  --margin=1,2'

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] 
      \ }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=5

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.8)
    let opts = { 'relative': 'editor',
          \ 'row': (&lines - height) / 2,
          \ 'col': (&columns - width) / 2,
          \ 'width': width,
          \ 'height': height,
          \ 'style': 'minimal'
          \ }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap <Space>? :Helptags<cr>
nnoremap <Space>f :Files<cr>
nnoremap <Space>F :GFiles<cr>
nnoremap <Space><C-F> :GFiles?<cr>
nnoremap <Space>mr :History<cr>
nnoremap <Space>mn :<c-u>call fzf#vim#maps('n', 0)<cr>
nnoremap <Space>mv :<c-u>call fzf#vim#maps('x', 0)<cr>
nnoremap <Space>mi :<c-u>call fzf#vim#maps('i', 0)<cr>
nnoremap <Space>mo :<c-u>call fzf#vim#maps('o', 0)<cr>
nnoremap <Space>b :Buffers<cr>
nnoremap <Space>t :Tags<cr>
nnoremap <Space>T :BTags<cr>
nnoremap \c :Colors<cr>

let g:fzf_files_options=' --bind alt-a:select-all,alt-d:deselect-all '
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


let g:fzf_action = {
      \ 'ctrl-q': function('myfunctions#fzf#build_location_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
"
" }}}


" nerdcommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 0

vmap <Space>cc  <Plug>NERDCommenterComment
vmap <Space>cu  <Plug>NERDCommenterUncomment
nmap <Space>cc  <Plug>NERDCommenterComment
nmap <Space>cu  <Plug>NERDCommenterUncomment
" }}}
