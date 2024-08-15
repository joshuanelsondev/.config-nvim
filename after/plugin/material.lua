
vim.g.material_style = "oceanic"

require('material').setup({
    contrast = {
    },
    disable = {
      borders = true,
    },
    plugins = {
      "nvim-tree",
      "nvim-web-devicons",
      "telescope",
    },
    custom_highlights = {
      -- Telescope Prompt
      TelescopePromptBorder = { fg = "#253238", bg = "#1E2021" },
      TelescopePromptTitle = { fg = "#ACD7E6", bg = "#1E2021" },
      TelescopePromptNormal = { fg = "#ACD7E6", bg = "#1E2021" },

      -- Telescope Results
      TelescopeResultsBorder = { fg = "#253238", bg = "#1E2021" },
      TelescopeResultsTitle = { fg = "#ACD7E6", bg = "#1E2021" },
      TelescopeResultsNormal = { fg = "#ACD7E6", bg = "#1E2021" },

      -- Telescope Preview
      TelescopePreviewBorder = { fg = "#253238", bg = "#1E2021" },
      TelescopePreviewTitle = { fg = "#ACD7E6", bg = "#1E2021" },
      TelescopePreviewNormal = { fg = "#ACD7E6", bg = "#1E2021" },

      -- Selection and Matching
      TelescopeSelection = { fg = "#35c0b4", bg = "#1E2021" },
      TelescopeMatching = { fg = "#35c0b4", bg = "#1E2021" },

      Normal = { fg = "#ffffff", bg = "none" },
      Identifier = { fg = "#ffffff" },
      LineNr = { fg = "silver" },
      CursorLineNr = { fg = "#35C0B4" },
      Cursor = { fg = "#35C0B4" },
      Comment = { fg = "#35C0B4" },
      Visual = { fg = "#ffffff", bg = "#35C0B4" },

    },

    custom_colors = function(colors)
      colors.syntax.variable = "#C792EA"
      colors.syntax.keyword = "#C792EA"
      colors.syntax.value = "#F78C6C"
      colors.syntax.operator = "#89DDFF"
      colors.syntax.fn = "#82AAFF"
      colors.syntax.string = "#C3E88D"
      colors.syntax.type = "#FFCB6B"
    end
})

vim.cmd('colorscheme material')
