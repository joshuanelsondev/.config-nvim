-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>pv', ':NvimTreeOpen<CR>:wincmd p | q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-e>", "<Nop>", { silent = true, noremap = true })

require('nvim-tree').setup {
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    ignore = false
  }
}
