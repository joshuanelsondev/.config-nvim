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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.o.background = 'dark'
vim.o.t_Co = '256'

vim.o.cursorline = true

vim.o.laststatus = 2

vim.o.clipboard = 'unnamed'
vim.o.cindent = true
vim.cmd('set cinkeys-=0#')
vim.o.belloff = 'all'
vim.o.backspace = '2'
