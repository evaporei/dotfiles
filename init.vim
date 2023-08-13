" search case-insensitive
set ignorecase

" search case-sensitive if expression contains a capital letter
set smartcase

" show line numbers
set number

" set terminal's title
set title

" use visual bell instead of audible bell
" (testing w/out it)
" set visualbell

" enable mouse in all modes
" (doesn't seem necessary)
" set mouse=a

" <TAB> settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set foldmethod=indent
" disable fold at start
set nofoldenable

" files open expanded
" (we'll see our curr xp w/ other window buffers)
" set foldlevelstart=50

" useful status information at bottom of screen
" (maybe not used because of vim-airline)
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ L%l,%c-%v\ %)%P

set diffopt+=vertical


" ----------------
" | Key Mappings |
" ----------------

let mapleader = "\<Space>"

" clipboard copy/paste
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>P "+P

" navigate through windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" create windows
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>m <C-w>s<C-w>j
nnoremap <leader>d <C-w>q

" edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" reload .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" map <C-C> to <esc>
noremap <C-C> <esc>

if has('autocmd')
  augroup set_font
    autocmd!

    set guifont=Roboto_for_Powerline:h13
    set linespace=2

    "Access colors present in 256 colorspace
    let base16colorspace=256
    autocmd BufEnter * colorscheme dracula
  augroup END
endif


" ------------------
" | Plugins Config |
" ------------------

call plug#begin('~/.vim/plugins')
  Plug 'rking/ag.vim'

  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'scrooloose/nerdtree'

  " help commenting across multiple filetypes
  Plug 'tomtom/tcomment_vim'

  " autoclose things like parentheses, quotes, etc
  Plug 'cohama/lexima.vim'

  " a more complete and beautiful status bar
  Plug 'vim-airline/vim-airline'

  " themes for vim-airline plugin
  Plug 'vim-airline/vim-airline-themes'

  " align things with =
  Plug 'junegunn/vim-easy-align'

  " syntax highlighting for many programming languages
  Plug 'sheerun/vim-polyglot'

  " toggles between relative and absolute line numbers
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

  " provide base16 colorschemes (macos iterm2)
  Plug 'chriskempson/base16-vim'

  Plug 'crusoexia/vim-dracula'

  Plug 'junegunn/fzf'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " LSP providers
  " Plug 'neoclide/coc.nvim', {'branch': 'release'} " I think you're not using this
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  
  Plug 'wakatime/vim-wakatime'

  Plug 'github/copilot.vim'
call plug#end()


" ------------------
" | Plugins Config |
" ------------------

" ---------------
" | Plugin - Ag |
" ---------------

noremap <C-F> :Ag!<space>

" ------------------
" | Plugin - CtrlP |
" ------------------

" work not only in ancestor directories of the working directory
let g:ctrlp_working_path_mode = 'a'

" ignore custom folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store'

" ignore git ignored folders
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" ---------------------
" | Plugin - NerdTree |
" ---------------------

noremap <leader>ft :NERDTreeToggle<CR>

" don't fuck up vim's default file browser

let g:NERDTreeHijackNetrw = 0

" --------------------
" | Plugin - Airline |
" --------------------

let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
autocmd BufEnter * :AirlineRefresh

" ----------------------
" | Plugin - EasyAlign |
" ----------------------

" start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---------------------------
" | Plugin - LanguageClient |
" ---------------------------

let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

let g:editorconfig = v:true

" disable copilot by default
" to enable: `:Copilot enable`
let g:copilot_enabled = v:false

" syntax highlighting for assembly
autocmd BufRead,BufNewFile *.asm set filetype=nasm
