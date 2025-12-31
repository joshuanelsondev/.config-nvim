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
    n = '#35C0B4',      -- Aqua
    no = '#f38ba8',     -- Red/Pink
    i = '#a6e3a1',      -- Green
    v = '#f9e2af',      -- Yellow
    V = '#f9e2af',      -- Yellow
    ['\22'] = '#C75AE3',-- Purple
    c = '#89b4fa',      -- Light Blue
    R = '#DF3030',      -- Bright Red
    t = '#94e2d5',      -- Teal
  }

  local mode = vim.api.nvim_get_mode().mode
  return {
    bg = mode_colors[mode] or '#0FBCA2',
    fg = '#111111', 
    gui = 'bold'
  }
end

local dynamic_theme = function()
  local colors = mode_color
  local full_style = { a = colors, b = colors, c = colors, x = colors, y = colors, z = colors }
  return {
    normal = full_style,
    insert = full_style,
    visual = full_style,
    command = full_style,
    replace = full_style,
    inactive = { a = { bg = '#222222', fg = '#666666' }, b = { bg = '#222222', fg = '#666666' }, c = { bg = '#222222', fg = '#666666' } }
  }
end

require('lualine').setup {
  options = {
    theme = dynamic_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        function() return mode_map[vim.api.nvim_get_mode().mode] or "__" end,
        padding = { left = 1, right = 2 }
      }
    },
    lualine_b = {
      { 'filename', path = 1, symbols = { modified = '[+]', readonly = '[RO]', unnamed = '' } },
      'branch'
    },
    lualine_c = { '%=' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', padding = { left = 2, right = 1 } },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_z = { 'location' },
  },
}
