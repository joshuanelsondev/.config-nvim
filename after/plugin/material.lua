vim.g.material_style = "oceanic"

require('material').setup({
    contrast = {
        sidebars = true,
        floating_windows = true,
    },
})
vim.cmd('colorscheme material')
vim.cmd('highlight Normal ctermbg=NONE')
vim.cmd('highlight nonText ctermbg=NONE')
vim.cmd('highlight LineNr guifg=silver')
vim.cmd('highlight CursorLineNr guifg=#35C0B4')
vim.cmd('highlight Comment guifg=#35C0B4')
vim.cmd('highlight Visual guifg=#ffffff guibg=#35C0B4')
