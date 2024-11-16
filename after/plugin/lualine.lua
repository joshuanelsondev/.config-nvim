require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { { 'filename', path = 1, symbols = {
          modified = '[+]',
          readonly = '[RO]',
          unnamed = '[No Name]',
        },
        color = function()
          local modified = vim.bo.modified
          return { fg = modified and '#DF3030' or '#0FBCA2' }
        end,
      }, 'branch' },
    lualine_c = {
      '%=',
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
