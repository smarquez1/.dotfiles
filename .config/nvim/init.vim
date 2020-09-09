call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim' " Simplifies transition between multiline and single-line code
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'janko-m/vim-test' " Vim test runner
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
      \ Plug 'junegunn/fzf.vim' |
      \ Plug 'stsewd/fzf-checkout.vim' " fuzzy finder 
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'justinmk/vim-sneak' " Jump to any location specified by two characters.
Plug 'SirVer/ultisnips' |
  \ Plug 'honza/vim-snippets' " Snippets for vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with '.'
Plug 'tpope/vim-rhubarb' " vim-fugitive Github integration
Plug 'tpope/vim-surround' " Vim Surround
Plug 'mhinz/vim-signify' " git gutter signs Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'junegunn/goyo.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim' | " async completion framework
  Plug 'steelsojka/completion-buffers'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
" Appearance
Plug 'ap/vim-css-color' " Highlight colors
Plug 'henrik/vim-indexed-search' " Display number of search results
Plug 'itchyny/lightline.vim' " A light and configurable statusline/tabline plugin for Vim
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'

" HTMLish
Plug 'Valloric/MatchTagAlways'  " A Vim plugin that always highlights the enclosing html/xml tags
Plug 'AndrewRadev/tagalong.vim' " Change an HTML(ish) opening tag and take the closing one along as well
Plug 'tpope/vim-ragtag'         " mappings for templating languages (ex <% %>, <%= %>, <!-- -->

" Ruby
Plug 'ecomba/vim-ruby-refactoring'   " Refactoring tool for Ruby in vim!
Plug 'p0deje/vim-ruby-interpolation' " Simple plugin to add {} after hitting #
Plug 'tpope/vim-endwise'             " add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-rails'               " rails.vim: Ruby on Rails power tools

" other languages
Plug 'sheerun/vim-polyglot' " Better support for some languages

" Tmux integration
Plug 'benmills/vimux' " vim plugin to interact with tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

call plug#end()

luafile $HOME/.config/nvim/init.lua
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim
