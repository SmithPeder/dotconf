" General settings------------------------------------------------------------
  syntax on                                         " turn on syntax
  let mapleader = ","                               " map leader to ','
  filetype indent on                                " indent based on file type
  set encoding=utf8                                 " UTF8 encoding of file
  set number                                        " normal line numbers
  set ttimeoutlen=10                                " used for key code delays
  set scrolloff=10                                  " always keep lines at end
  set mouse=a                                       " enable mouse movements
  set nowrap                                        " lines don't wrap
  set noswapfile                                    " no stupid .swp file
  set autoindent                                    " turns on auto indent
  set smartindent                                   " does (mostly) right indenting
  set tabstop=2                                     " tabs are at proper location
  set shiftwidth=2                                  " one tab are 2 spaces
  set expandtab                                     " tabs are actually spaces
  set smarttab                                      " tabs fit with tabstops
  set hlsearch                                      " highlight all matching text
  set incsearch                                     " enable incremental search
  set ignorecase                                    " /the -> the/The/THE/tHe
  set smartcase                                     " goes together with ignorecase

" General mappings------------------------------------------------------------
  inoremap <C-e> <C-o>A
  nmap <silent> <leader><space> :noh<CR>
  map <leader>s :setlocal spell! spelllang=en_us<CR>
  nnoremap <LEADER>u :UndotreeToggle<cr>
  noremap! <C-BS> <C-w>
  noremap! <C-h> <C-w>
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
  noremap <C-l> :tabnext<CR>
  noremap <C-h> :tabprevious<CR>
  noremap <C-t> :tabnew<CR>
  noremap <C-s> :w<CR>
  inoremap <C-s> <esc>:w<CR>
  noremap <C-c> :q<CR>

" DIY auto closing mappings---------------------------------------------------
  inoremap (( ()<left>
  inoremap [[ []<left>
  inoremap {{ {}<left>
  inoremap "" ""<left>
  inoremap '' ''<left>
  inoremap `` ``<left>
  inoremap << <><left>
  inoremap (<cr> (<cr>)<esc>O
  inoremap {<cr> {<cr>}<esc>O
  inoremap [<cr> [<cr>]<esc>O

" Vundel plugin manager config------------------------------------------------
  set nocompatible                                  " required for vundle
  filetype off                                      " required for vundle
  set rtp+=~/.vim/bundle/Vundle.vim                 " runtime path
  call vundle#begin('~/.vim/bundle')                " START ADDING PLUGINS
  Plugin 'VundleVim/Vundle.vim'                     " main vundle plugin

  Plugin 'joshdick/onedark.vim'                     " onedark style
  Plugin 'sheerun/vim-polyglot'                     " syntax
  Plugin 'dikiaap/minimalist'
  Plugin 'itchyny/lightline.vim'                    " statusline
  Plugin 'itchyny/vim-gitbranch'                    " git for statusline
  Plugin 'maximbaz/lightline-ale'                   " ale errors in statusline
  Plugin 'scrooloose/nerdtree'                      " document tree
  Plugin 'jistr/vim-nerdtree-tabs'                  " document tree tabs
  Plugin 'Xuyuanp/nerdtree-git-plugin'              " git flags
  Plugin 'mbbill/undotree'                          " list all undos you can do
  Plugin 'airblade/vim-gitgutter'                   " show vim diff in gutter
  Plugin 'pangloss/vim-javascript'                  " better javascript support
  Plugin 'mxw/vim-jsx'                              " allow jsx syntax
  Plugin 'ctrlpvim/ctrlp.vim'                       " beloved fuzzyfinder
  Plugin 'w0rp/ale'                                 " support linting
  Plugin 'ervandew/supertab'                        " completion
  Plugin 'JuliaEditorSupport/julia-vim'             " julia support
  Plugin 'airblade/vim-rooter'                      " always get root folder
  Plugin 'fatih/vim-go'                             " go support
  Plugin 'alvan/vim-closetag'                       " html close

  call vundle#end()                                 " STOP ADDING PLUGINS
  filetype plugin indent on                         " turn back on again
" ----------------------------------------------------------------------------

" Lightline
  set laststatus=2
  let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ] , [ 'readonly', 'filename', 'filetype', 'gitbranch'] ],
    \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
    \ },
    \ 'component_function': {
    \    'gitbranch': 'gitbranch#name'
    \ },
    \ }

  let g:lightline.component_expand = {
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
    \ }

  let g:lightline.component_type = {
    \  'linter_checking': 'left',
    \  'linter_warnings': 'warning',
    \  'linter_errors': 'error',
    \  'linter_ok': 'left',
    \ }

  let g:lightline#ale#indicator_checking = "Checking..."
  let g:lightline#ale#indicator_warnings = "Warnings:"
  let g:lightline#ale#indicator_errors = "Errors:"
  let g:lightline#ale#indicator_ok = "Good"

" Theme settings
  let g:spacegray_termcolors = 256
  set t_Co=256
  colorscheme minimalist
  let g:spacegray_underline_search = 1
  
" Using vim tree to make vim more user friendly-------------------------------
  map <LEADER>, :NERDTreeTabsToggle<CR>
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:NERDTreeShowIgnoredStatus = 1
  let g:NERDTreeWinSize = 30
  let NERDTreeShowHidden = 1
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Puts you in insertmode when file is gitcommit
  autocmd FileType gitcommit  exec 'au VimEnter * startinsert'

" Git gutter settings
  let g:gitgutter_sign_added = '|'
  let g:gitgutter_sign_modified = '|'
  let g:gitgutter_sign_removed = '|'
  let g:gitgutter_sign_removed_first_line = '__'
  let g:gitgutter_sign_modified_removed = '__'

" Ale settings---------------------------------------------------------------
  let g:ale_fixers = {
    \  'javascript': ['prettier'],
  \}
  let g:ale_fix_on_save = 1
  let g:ale_sign_column_always = 1
  let g:ale_lint_on_text_changed = 'never'

" CTRLP .ignore files/folders
  let g:ctrlp_max_files = 0
  set wildignore+=*/venv/*,*/target/*,*/node_modules/*,*/*.class,*/*.pyc,*/*.o
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Set dict, only when spelling is on
  set dictionary="/usr/dict/words"

" Use matchit when writing Julia
  runtime macros/matchit.vim

" Other stuff
  hi VertSplit ctermbg=234 ctermfg=234

" HTML closing
	let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
  let g:closetag_filetypes = 'html,xhtml,phtml'
  let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
  let g:closetag_emptyTags_caseSensitive = 1
  let g:closetag_shortcut = '>'
  let g:closetag_close_shortcut = '<leader>>'
