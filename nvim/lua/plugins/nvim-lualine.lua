local function window()
  return vim.api.nvim_win_get_number(0)
end

local gps = require('nvim-gps')

require('lualine').setup {
    options = {
        theme = 'tokyonight'
    },
    extensions = {
        'nvim-tree',
        'symbols-outline'
    },
    sections = {
        lualine_c = {
            'filename',
            { gps.get_location, cond = gps.is_available }
        }
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {window},
        lualine_z = {'tabs'}
    }
}
