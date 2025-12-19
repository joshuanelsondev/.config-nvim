local mode_map = {
  ['n']      = 'NORMAL',
  ['no']     = '-- PENDING --',
  ['v']      = '-- VISUAL --',
  ['V']      = '-- VISUAL LINE --',
  ['\22']    = '-- VISUAL BLOCK --',
  ['s']      = 'SELECT',
  ['S']      = 'SELECT LINE',
  ['\19']    = 'SELECT BLOCK',
  ['i']      = '-- INSERT --',
  ['ic']     = '-- INSERT --',
  ['ix']     = '-- INSERT --',
  ['R']      = 'REPLACE',
  ['Rc']     = 'REPLACE',
  ['Rv']     = 'VISUAL REPLACE',
  ['Rx']     = 'REPLACE',
  ['c']      = '-- COMMAND --',
  ['cv']     = 'VIM EX',
  ['ce']     = 'EX',
  ['r']      = 'PROMPT',
  ['rm']     = 'MORE',
  ['r?']     = 'CONFIRM',
  ['!']      = 'SHELL',
  ['t']      = '-- TERMINAL --',
}

local mode_color = function()
  local mode_colors = {
    n = '#89b4fa',      -- Light Blue
    no = '#f38ba8',     -- Red/Pink
    i = '#a6e3a1',      -- Green
    v = '#f9e2af',      -- Yellow
    V = '#f9e2af',      -- Yellow
    ['\22'] = '#C75AE3',-- Purple
    c = '#35C0B4',      -- Aqua
    R = '#DF3030',      -- Bright Red
    t = '#94e2d5',      -- Teal
  }
  
  local mode = vim.api.nvim_get_mode().mode
  return {
    bg = mode_colors[mode] or '#0FBCA2',
    fg = '#111111', -- Dark text color for high contrast
    gui = 'bold'
  }
end

require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    -- Left side: Mode display
    lualine_a = {
      {
        function()
          return mode_map[vim.api.nvim_get_mode().mode] or "__"
        end,
        color = mode_color,
        separator = { left = '' },
        right_padding = 2
      }
    },
    -- Filename and Branch
    lualine_b = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = '[+]',
          readonly = '[RO]',
          unnamed = '[]',
        },
        color = function()
          return { fg = vim.bo.modified and '#DF3030' or '#0FBCA2' }
        end,
      },
      'branch'
    },
    -- Empty center with alignment
    lualine_c = {
      '%=',
    },
    lualine_x = {},
    -- File details
    lualine_y = { 'filetype', 'progress' },
    -- Right side: Location display
    lualine_z = {
      { 
        'location', 
        color = mode_color, -- Applied the dark text/mode color logic here
        separator = { right = '' }, 
        left_padding = 2 
      },
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
