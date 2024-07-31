local builtin = require('telescope.builtin')

-- Layout configuration
local function find_files_with_layout()
  builtin.find_files({
    layout_strategy = 'horizontal',
    borderchars = {' ','','','','','','',''},
    layout_config = {
      height = 30,
      width = 100,
      preview_width = 50,
      preview_cutoff = 100,
      prompt_position = 'bottom',
    },
  })
end

local function git_files_with_layout()
  builtin.git_files({
    layout_strategy = 'horizontal',
    layout_config = {
      height = 30,
      width = 100,
      preview_width = 50,
      preview_cutoff = 100,
      prompt_position = 'bottom',
    },
  })
end

local function grep_string_with_layout()
  builtin.grep_string({
    layout_strategy = 'horizontal',
    layout_config = {
      height = 30,
      width = 100,
      preview_width = 50,
      preview_cutoff = 100,
      prompt_position = 'bottom',
    },
    search = vim.fn.input("Grep > ")
  })
end

vim.keymap.set('n', '<leader>pf', find_files_with_layout, {})
vim.keymap.set('n', '<leader>pg', git_files_with_layout, {})
vim.keymap.set('n', '<leader>ps', grep_string_with_layout, {})
