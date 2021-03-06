"" ===================================================
" Install Plug if it's not installed
" ===================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===================================================
" Plug install list
" ===================================================
call plug#begin('~/.vim/plugged')
  " Git
  Plug 'airblade/vim-rooter'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Search
  Plug 'haya14busa/incsearch.vim'
  Plug 'google/vim-searchindex'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ojroques/nvim-lspfuzzy', {'branch': 'main'}

  " Language
  Plug 'neovim/nvim-lspconfig'
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-lua/completion-nvim'

  " UI
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'RRethy/vim-illuminate'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'

  " Icons
  Plug 'kyazdani42/nvim-web-devicons'

  " Explorer
  Plug 'kyazdani42/nvim-tree.lua'

  " Statusbars (top and bottom)
  Plug 'itchyny/lightline.vim'
  Plug 'romgrk/barbar.nvim'

  " Parentheses
  Plug 'Raimondi/delimitMate'

  " Linting
  Plug 'w0rp/ale'

call plug#end()
