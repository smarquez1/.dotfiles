local map = require('utils').map

-- Completion does not select anything automatically
vim.o.completeopt = 'menuone,noselect'
-- Do not display "Pattern not found" messages during completion.
vim.cmd [[set shortmess+=c]]

-- Navigate popup menues with j and k
-- inoremap <expr> <C-J> pumvisible() ? "\<c-n>" : "j"
-- inoremap <expr> <C-K> pumvisible() ? "\<c-p>" : "k"

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

require('compe').setup {
  enabled = true;
  autocomplete = true;
  minlength = 1;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    ultisnips = true;
    snippets_nvim = true;
    treesitter = true;
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
  --   return t "<Plug>(UltiSnips#ExpandSnippetOrJump)"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

local opts = { expr = true }
map("i", "<Tab>", "v:lua.tab_complete()")
map("s", "<Tab>", "v:lua.tab_complete()")
map("i", "<S-Tab>", "v:lua.s_tab_complete()")
map("s", "<S-Tab>", "v:lua.s_tab_complete()")

vim.g.UltiSnipsExpandTrigger="<c-l>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<s-tab>"
vim.cmd [[
autocmd FileType javascript,javascriptreact,typescript,typescriptreact UltiSnipsAddFiletypes javascript.javascriptreact.typescript.typescriptreact
]]