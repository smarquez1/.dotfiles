vim.api.nvim_exec(
[[
  " Enable mouse
  set mouse=a
  " Allow using local nvimrc
  set exrc
  " Configure search
  set ignorecase smartcase
  " Enable live substitution
  set inccommand=nosplit
  " No backups or swapfile
  set nobackup nowritebackup noswapfile
  " Keep undo history for hidden buffers
  set hidden
  " Show line numbers
  set number relativenumber
  " more Natural splits behaviour
  set splitbelow splitright
  " Wrap text
  set linebreak breakindent
  " Show breakline symbol
  set showbreak=↪\
  " Use system's clipboard
  set clipboard=unnamed,unnamedplus
  " Ident using 2 spaces by default
  set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
  " Enable folding by default
  set foldmethod=indent foldlevel=99
  " Support 24 bit color
  set termguicolors
  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
  set updatetime=300
  " the screen will not be redrawn unless necessary
  set lazyredraw
  " Highlight cursor
  " set cursorline
  " number of lines to scroll when the cursor gets off the screen
  set sidescrolloff=5 scrolloff=5

  " ft=markdown
  " Enable spelling
  autocmd FileType markdown setl spell
  " ft=terminal
  " Start on insert mode.
  autocmd TermOpen term://* startinsert
  " No line numbers
  autocmd TermOpen * setlocal nonumber norelativenumber

  " KEY MAPPINGS
  " map leader to space
  let mapleader = " "
  " Semicolon is colon
  map ; :
  " Save file
  map <leader>w :w <cr>
  " Quicker window movement
  nmap <c-j> <c-w>j
  nmap <c-k> <c-w>k
  nmap <c-l> <c-w>l
  nmap <c-h> <c-w>h
  " Make navigation into and out of Neovim terminal splits nicer.
  tmap <c-h> <c-\><c-n><c-w>h
  tmap <c-j> <c-\><c-n><c-w>j
  tmap <c-k> <c-\><c-n><c-w>k
  tmap <c-l> <c-\><c-n><c-w>l
  " Easy splitting
  map <leader>s :split <cr>
  map <leader>v :vsplit <cr>
  " Cancel a search with Escape:
  nmap <silent> <Esc> :nohlsearch<Bar>:echo<CR> " Escape from terminal goes to normal mode
  " tmap <Esc> <C-\><C-n>
  " map . in visual mode
  vmap . :norm.<cr>
  " unmap ex mode: 'Type visual to go into Normal mode.'
  nmap Q <nop>
  " Replace hashrockets with 1.9 hash style syntax
  nmap <leader>: :%s/:\(\w\+\)\s*=>\s*/\1: /g <cr>

  " diff
  if &diff
    map <C-J> ]c
    map <C-K> [c
  endif
]],
true)

-- The g:vimsyn_embed option allows users to select what, if any, types of
vim.g.vimsyn_embed= 'l'

vim.cmd [[autocmd BufWritePost init.vim PackerCompile]]
vim.cmd 'packadd packer.nvim' 

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }
  use 'tpope/vim-commentary'
  use {
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb' -- git wrapper + Github integration
  }
  use 'tpope/vim-repeat' -- enable repeating supported plugin maps with '.'
  use 'tpope/vim-surround' -- Vim Surround
  use {
    'janko-m/vim-test',
    requires = 'benmills/vimux' -- Vim test runner
  }
  use 'mg979/vim-visual-multi' -- Multiple cursors
  use 'AndrewRadev/splitjoin.vim' -- change between multiline and single-line code
  use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits
  use 'jiangmiao/auto-pairs' -- insert or delete brackets, parens, quotes in pair
  use 'mhinz/vim-signify' -- Git gutter
  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require('bufferline').setup() end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('nvim_treesitter_config') end
  }
  use {
    'hrsh7th/nvim-compe',
    config = function() require('compe_config') end,
    requires = { 'SirVer/ultisnips', 'honza/vim-snippets' }
  }
  -- Navigation
  use {
    'nvim-lua/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim' -- File navigator
    },
    config = {} -- function() require('telescope_config') end
  }
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = '-> fzf#install()' }
  }
  use 'kyazdani42/nvim-tree.lua'
  use {
    'dyng/ctrlsf.vim', -- Mimics Ctrl-Shift-F on Sublime Text 2
    config = function() require('ctrlsf_config') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp/init') end
  }
  use 'nvim-lua/lsp-status.nvim'

  use 'kosayoda/nvim-lightbulb'

  -- Appearance
  use 'henrik/vim-indexed-search' -- Display number of search results
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('lualine_config') end
  }
  use {
    'joshdick/onedark.vim', -- Colorscheme based on atom onedark
    config = function() require('onedark') end
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup({ default = true; }) end -- icons for lua plugins
  }
  use 'dstein64/nvim-scrollview'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }
  -- Ruby
  use {
    'ecomba/vim-ruby-refactoring',
    'p0deje/vim-ruby-interpolation', -- Simple plugin to add {} after hitting #
    'tpope/vim-endwise',             -- add 'end' to functons
    'tpope/vim-rails'               -- rails.vim: Ruby on Rails power tools
  }

  -- HTMLish
  use 'Valloric/MatchTagAlways' -- Highlights enclosing html/xml tags
  use {
    'mattn/emmet-vim',
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact'
    }
  }
  use 'AndrewRadev/tagalong.vim' -- Change opening tag and closing tags
  use 'tpope/vim-ragtag' -- ex <% %>, <%= %>, <!-- -->
  -- Other
  use 'chrisbra/csv.vim'

  local map = require('utils').map

  vim.g.nvim_tree_width_allow_resize = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_disable_netrw = 0 -- So :GBrowse works
  vim.g.nvim_tree_hijack_netrw = 0
  vim.g.nvim_tree_bindings = {
	  ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
	  ["h"] = ":lua require'nvim-tree'.on_keypress('close_node')<CR>",
  }

  map('n', '<leader>d', ':NvimTreeToggle<cr>')

  vim.api.nvim_exec(
  [[
    let test#strategy = "vimux"
    let test#ruby#use_binstubs = 0
    nmap <leader>T :TestFile<CR>
    nmap <leader>t :TestNearest<CR>
    nmap <leader>l :TestLast<CR>

    nmap <leader>gd :Gdiff<CR>
    " Open current line in the browser
    nmap <leader>gb :.Gbrowse<CR>
    " Open visual selection in the browser
    vmap <leader>gb :Gbrowse<CR>

    autocmd FileType javascript,javascriptreact,typescript,typescriptreact UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact

    let $fzf_default_command = 'fd --type f'
    let $fzf_default_opts .= '--layout=reverse --inline-info'
    autocmd filetype fzf tmap <buffer> <c-j> <down>
    autocmd filetype fzf tmap <buffer> <c-k> <up>

    " use shif-tab to expand, default: `<c-y>,`
    " imap <s-tab> <plug>(emmet-expand-abbr)

    nmap <silent> <leader>f :files<cr>
    nmap <silent> <leader>b :buffers<cr>
    nmap <silent> <leader>gb :gbranches<cr>
    nmap <silent> <leader>ht :helptags<cr>
    " list all yadm tracked files
    nmap <silent> <leader>ed :call fzf#run(fzf#wrap({'source': 'yadm list -a', 'dir': '~' }))<cr>
    " rails
    " find models
    nmap <silent> <leader>em :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/models' }))<cr>
    nmap <silent> <leader>ec :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/controllers' }))<cr>
    nmap <silent> <leader>ev :call fzf#run(fzf#wrap({'source': 'git ls-files', 'dir': 'app/views' }))<cr>
  ]]
  , true)

  vim.g.fugitive_git_executable = 'LANG=en_US git'

  vim.g.UltiSnipsExpandTrigger="<c-l>"
  vim.g.UltiSnipsJumpForwardTrigger="<tab>"
  vim.g.UltiSnipsJumpBackwardTrigger="<s-tab>"

  -- Customize fzf colors to match your color scheme
  -- https://github.com/junegunn/fzf.vim/issues/1152#issuecomment-747156597
  -- vim.g.fzf_colors = {
  --   'fg' =      ['fg', 'Normal'],
  --   'bg' =      ['bg', 'Normal'],
  --   'hl' =      ['fg', 'Comment'],
  --   'fg+' =     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  --   'bg+' =     ['bg', 'CursorLine', 'CursorColumn'],
  --   'hl+' =     ['fg', 'Statement'],
  --   'info' =    ['fg', 'PreProc'],
  --   'border' =  ['fg', 'Ignore'],
  --   'prompt' =  ['fg', 'Conditional'],
  --   'pointer' = ['fg', 'Exception'],
  --   'marker' =  ['fg', 'Keyword'],
  --   'spinner' = ['fg', 'Label'],
  --   'header' =  ['fg', 'Comment']
  -- }

  vim.g.endwise_no_mappings=1
  map('n', '<leader>a', ':A<cr>')
  map('n',  '<leader>av', ':AV <cr>')
  map('n', '<leader>as', ':AS<cr>')

  -- vim.g.mta_filetypes = { 'html'= 1, 'javascriptreact'= 1, 'typescriptreact' = 1, 'eruby' = 1, 'liquid' = 1, 'markdown' = 1 }

  vim.g.ragtag_global_maps = 1

  vim.g.csv_strict_columns = 1
  vim.g.csv_start = 1
  vim.g.csv_end = 1000
end)
