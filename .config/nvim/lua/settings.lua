-- Completion does not select anything automatically
vim.o.completeopt = 'menuone,noselect'

vim.o.mouse = 'a' -- Enable mouse
vim.o.updatetime = 200  -- Faster completion ??
vim.opt.shortmess:append('atsc')
-- Do not display "Pattern not found" messages during completion.
-- vim.o.shortmess = vim.o.shortmess .. "c" -- Do not give completion message prompts.
vim.o.lazyredraw = true -- the screen will not be redrawn unless necessary
-- Appearance
vim.o.termguicolors = true -- Support 24 bit color
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true -- Highlight cursor
vim.o.scrolloff = 4
vim.wo.signcolumn="yes"  --Always show the signcolumn, otherwise it would shift the text each time
-- Search
vim.o.ignorecase = true
vim.o.smartcase  = true
vim.o.inccommand = 'split' -- Enable live substitution
-- No backups or swapfile
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.hidden = true -- Keep undo history for hidden buffers
-- More Natural splits behaviour
vim.o.splitbelow = true
vim.o.splitright = true
-- Wrap text
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = '↲ ' -- Show breakline symbol
vim.o.clipboard = 'unnamed,unnamedplus' -- Use system's clipboard
vim.bo.expandtab = true -- converts tabs to spaces
vim.o.shiftwidth = 2 -- number of space characters inserted for indentation
	-- conceallevel = 0,
-- ft=markdown
vim.cmd [[autocmd FileType markdown setl spell]] -- Enable spelling
-- ft=terminal
vim.cmd [[autocmd TermOpen term://* startinsert]] -- Start on insert mode.
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]] -- No line numbers
