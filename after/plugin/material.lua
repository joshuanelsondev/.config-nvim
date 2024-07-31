vim.g.material_style = "oceanic"

require('material').setup({
    contrast = {
        sidebars = true,
    },
    plugins = {
      "nvim-tree",
      "nvim-web-devicons",
      "telescope",
    },
    custom_highlights = {
      Normal = { ctermbg = "NONE" },
      nonText = { ctermbg = "NONE" },
      LineNr = { fg = "silver" },
      CursorLineNr = { fg = "#35C0B4" },
      Cursor = { fg = "#35C0B4" },
      CurSearch = { bg = "#35C0B4", fg = "#ffffff" },
      Comment = { fg = "#35C0B4" },
      Visual = { fg = "#ffffff", bg = "#35C0B4" },
    }
})
vim.cmd('colorscheme material')
