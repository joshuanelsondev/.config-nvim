-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.api.nvim_set_keymap('n', '<leader>\\', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>pv', ':NvimTreeOpen<CR>:wincmd p | q<CR>', { noremap = true, silent = true })

require('nvim-tree').setup {
  view = {
    width = 30,
    side = "left",
    relativenumber = true,
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    ignore = false,
  },
  renderer = {
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
}
