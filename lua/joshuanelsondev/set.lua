vim.cmd([[
  highlight Search guifg=#ffffff guibg=#35c0b4 gui=bold
  highlight IncSearch guifg=#ffffff guibg=#35c0b4 gui=bold
]])

vim.g.mapleader = ' '
vim.opt.mouse = ""

vim.defer_fn(function()
  vim.opt.termguicolors = true
  vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i:ver25-Cursor,ve:ver35-Cursor,o:hor50-Cursor"
  vim.cmd [[highlight Cursor guifg=white guibg=#35C0B4]]
end, 100)

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
