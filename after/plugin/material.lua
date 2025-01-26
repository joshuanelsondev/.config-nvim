
vim.g.material_style = "oceanic"

require('material').setup({
    disable = {
      borders = true,
      background = true,
    },
    plugins = {
      "nvim-tree",
      "nvim-web-devicons",
      "telescope",
    },
    custom_highlights = {
      -- Telescope Prompt Counter (number of results)
      TelescopePromptCounter = { fg = "#35C0B4", bg = "none", bold = true },
      -- Telescope Prompt
      TelescopePromptBorder = { fg = "#3E535A" },
      TelescopePromptTitle = { fg = "#ACD7E6", bg = "#253237" },
      TelescopePromptNormal = { fg = "#ACD7E6", bg = "#253237" },

      -- Telescope Results
      TelescopeResultsBorder = { fg = "#3E535A" },
      TelescopeResultsTitle = { fg = "#ACD7E6", bg = "#253237" },
      TelescopeResultsNormal = { fg = "#ACD7E6", bg = "#253237" },

      -- Telescope Preview
      TelescopePreviewBorder = { fg = "#3E535A" },
      TelescopePreviewTitle = { fg = "#ffffff", bg = "#253237" },
      TelescopePreviewNormal = { fg = "#ACD7E6", bg = "#253237" },

      -- Selection and Matching
      TelescopeSelection = { fg = "#ffffff", bg = "#35c0b4" },

      Normal = { fg = "#ffffff", bg = "none" },
      Identifier = { fg = "#ffffff" },
      LineNr = { fg = "silver" },
      CursorLineNr = { fg = "#35C0B4" },
      Cursor = { fg = "#35C0B4" },
      Comment = { fg = "#35C0B4" },
      Visual = { fg = "#ffffff", bg = "#35C0B4" },
      Search = { fg = "#ff5370"},
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
