vim.cmd 'packadd packer.nvim'
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup({ function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- TODO: requires treesitter
  use {
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb', -- git wrapper + Github integration
    config = function() require('plugins.fugitive') end
  }
  use 'tpope/vim-repeat' -- enable repeating supported plugin maps with '.'
  use 'tpope/vim-surround' -- Vim Surround
  use {
    'janko-m/vim-test', -- Vim test runner
    requires = 'benmills/vimux',
    config = function() require('plugins.vim_test') end
  }
  use 'mg979/vim-visual-multi' -- Multiple cursors
  use 'AndrewRadev/splitjoin.vim' -- change between multiline and single-line code
  use 'christoomey/vim-tmux-navigator' -- Seamless navigation between tmux panes and vim splits
  use 'jiangmiao/auto-pairs' -- insert or delete brackets, parens, quotes in pair
  use {
    'phaazon/hop.nvim',
    config = function()
      local opts = { silent=true, noremap=true }
      vim.api.nvim_set_keymap('n', 's', ":HopChar2<cr>", opts)
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require('plugins.bufferline') end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end
  }
  use {
    'hrsh7th/nvim-compe',
    requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ', 'rafamadriz/friendly-snippets' },
    -- , 'SirVer/ultisnips', 'honza/vim-snippets'
    config = function() require('plugins.compe') end
  }
  -- Navigation
  use {
    'nvim-lua/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', },
    config = function() require('plugins.telescope') end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('plugins.nvim_tree') end
  }
  use {
    'dyng/ctrlsf.vim', -- Mimics Ctrl-Shift-F on Sublime Text 2
    config = function() require('plugins.ctrlsf') end
  }
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = 'glepnir/lspsaga.nvim',
    config = function() require('lsp.init') end
  }
  -- Appearance
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua',
    config = function() require('plugins.indent_blankline') end
  }
  use 'henrik/vim-indexed-search' -- Display number of search results
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end
  }
  use 'Th3Whit3Wolf/one-nvim'
  use 'ChristianChiarulli/nvcode-color-schemes.vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'dstein64/nvim-scrollview'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }
  -- Ruby
  use {
    'ecomba/vim-ruby-refactoring',
    'p0deje/vim-ruby-interpolation', -- Simple plugin to add {} after hitting #
    'tpope/vim-rails', -- rails.vim: Ruby on Rails power tools
    config = function() require('plugins.lualine') end
  }
  -- HTMLish
  use 'windwp/nvim-ts-autotag'
  use {
    'mattn/emmet-vim',
    ft = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'eruby' }
  }
  -- Others
  use 'tomlion/vim-solidity'
  use 'kchmck/vim-coffee-script'
end })
