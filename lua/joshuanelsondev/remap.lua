vim.g.mapleader = ' '

-- Normal mode mappings
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>j', ':m .+1<CR>==')
vim.keymap.set('n', '<leader>k', ':m .-2<CR>==')
vim.keymap.set('n', '<C-t>', ':Files!<CR>')
vim.keymap.set('n', '<C-p>', ':GFiles!<CR>')
vim.keymap.set('n', '<C-g>', ':Ag<CR>')
vim.keymap.set('n', '<leader><CR>', ':w<CR>')
vim.keymap.set('n', '<leader>s', ':%s/')
vim.keymap.set('n', '<leader>q', ':wq<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')


-- Insert mode mappings
vim.keymap.set('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('i', '<Tab>', '<Esc>')

-- Visual mode mappings
vim.keymap.set('v', '<leader>j', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<leader>k', ":m '<-2<CR>gv=gv")

-- General mappings
vim.keymap.set('', '<Tab>', '<Esc>')
vim.keymap.set('x', '<leader>p', "\"_dp")
