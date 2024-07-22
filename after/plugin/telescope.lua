local builtin = require('telescope.builtin')

-- Layout configuration
local function find_files_with_layout()
  builtin.find_files({
    layout_strategy = 'horizontal',
    layout_config = {
      height = 50,
      width = 100,
      preview_width = 60,
      preview_cutoff = 100,
      prompt_position = 'bottom',
    },
  })
end

local function git_files_with_layout()
  builtin.git_files({
    layout_strategy = 'horizontal',
    layout_config = {
      height = 50,
      width = 100,
      preview_width = 60,
      preview_cutoff = 100,
      prompt_position = 'bottom',
    },
  })
end

vim.keymap.set('n', '<leader>pf', find_files_with_layout, {})
vim.keymap.set('n', '<C-p>', git_files_with_layout, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
