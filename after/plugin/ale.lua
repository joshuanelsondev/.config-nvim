vim.g.ale_linters = {
  javascript = {'eslint'},
  typescript = {'tslint'},
}
vim.g.ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  javascript = {'eslint'},
  typescript = {'tslint'},
}
vim.g.ale_fix_on_save = 1

vim.api.nvim_set_keymap('n', '<leader>l', ':ALELint<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':ALEFix<CR>', { noremap = true, silent = true })
