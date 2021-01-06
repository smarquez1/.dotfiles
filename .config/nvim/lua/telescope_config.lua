local U = require 'utils'
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    },
  }
}

require('telescope').load_extension 'fzy_native'

local M = {}

function M.find_dotfiles()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~",
    find_command = { 'yadm', 'list', '-a' },
  }
end

local opts = {}

U.map('n', "<leader>f", "<CMD> lua require('telescope.builtin').find_files()<CR>", opts)
U.map('n', "<leader>B", ":lua require('telescope.builtin').buffers()<CR>", opts)
U.map('n', "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
U.map('n', "<leader>ht", ":lua require('telescope.builtin').help_tags()<CR>", opts)
U.map('n', "<leader>S",  ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", opts)
-- nmap <silent> <leader>S :CocList symbols<CR>
-- U.map('n', "<leader>fg", ":lua require('telescope.builtin').live_grep({prompt_prefix=🔍 })<CR>", opts)
  -- List all YADM tracked files
U.map('n', "<leader>ed", ":lua require('telescope_config').find_dotfiles()<CR>", opts)

return M
