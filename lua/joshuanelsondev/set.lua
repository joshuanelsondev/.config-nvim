-- Disable mouse support
vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.o.background = 'dark'

vim.o.cursorline = true

vim.o.laststatus = 2

vim.o.clipboard = 'unnamed'


-- Set highlight groups using vim.api.nvim_set_hl
vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'NonText', { ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'silver' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#35C0B4' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#35C0B4' })
