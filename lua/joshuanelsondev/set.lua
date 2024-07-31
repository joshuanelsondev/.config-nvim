vim.cmd('highlight Normal ctermbg=NONE')
vim.cmd('highlight nonText ctermbg=NONE')
vim.cmd('highlight LineNr guifg=silver')
vim.cmd('highlight CursorLineNr guifg=#35C0B4')
vim.cmd('highlight Cursor guifg=#35C0B4')
vim.cmd('highlight Comment guifg=#35C0B4')
vim.cmd('highlight Visual guifg=#ffffff guibg=#35C0B4')

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
