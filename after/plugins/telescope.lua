local builtin = require('telescope.builtin')

-- Layout configuration
local function find_files_with_layout()
  builtin.find_files({
    layout_strategy = 'center',
    layout_config = {
      --height = 25,
      prompt_position = 'top',
      preview_cutoff = 100,
    },
    --theme = 'dropdown',
  })
end

local function git_files_with_layout()
  builtin.git_files({
    layout_strategy = 'center',
    layout_config = {
      --height = 25,
      prompt_position = 'top',
      preview_cutoff = 100,
    },
    --theme = 'dropdown',
  })
end

vim.keymap.set('n', '<leader>pf', find_files_with_layout, {})
vim.keymap.set('n', '<C-p>', git_files_with_layout, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
