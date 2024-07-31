vim.g.material_style = "oceanic"

require('material').setup({
    contrast = {
        sidebars = true,
        floating_windows = true,
    },
    plugins = {
      "nvim-tree",
      "nvim-web-devicons",
      "telescope",
    },
})
vim.cmd('colorscheme material')
