
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
      -- Telescope Prompt
      TelescopePromptBorder = { fg = "#253238", bg = "#253238" },
      TelescopePromptTitle = { fg = "#ACD7E6", bg = "#253238" },
      TelescopePromptNormal = { fg = "#ACD7E6", bg = "#253238" },

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

      Normal = { fg = "#ffffff" },
      Identifier = { fg = "#ffffff" },
      LineNr = { fg = "silver" },
      CursorLineNr = { fg = "#35C0B4" },
      Cursor = { fg = "#35C0B4" },
      Comment = { fg = "#35C0B4" },
      Visual = { fg = "#ffffff", bg = "#35C0B4" },

    }
})

vim.cmd('colorscheme material')
