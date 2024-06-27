local nightfox = require('nightfox')

local palettes = {
   nordfox = {
       comment = "#35C0B4",
   },
}

nightfox.setup({
    palettes = palettes,
})

vim.cmd("colorscheme nordfox")

vim.cmd('highlight Normal ctermbg=NONE')
vim.cmd('highlight nonText ctermbg=NONE')
vim.cmd('highlight LineNr guifg=silver')
vim.cmd('highlight CursorLineNr guifg=#35C0B4')
vim.cmd('highlight Comment guifg=#35C0B4')
vim.cmd('highlight Visual guifg=#ffffff guibg=#35C0B4')
