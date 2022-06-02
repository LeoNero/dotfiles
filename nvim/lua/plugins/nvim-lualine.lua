local function window()
    return vim.api.nvim_win_get_number(0)
end

local gps = require('nvim-gps')

-- TODO remove git info from bufferline; keep it only on status line

require('lualine').setup {
    options = {
        -- theme = 'tokyonight',
        theme = 'catppuccin',
        disabled_filetypes = { 'packer', 'NvimTree' }
    },
    extensions = {
        'nvim-tree',
        'symbols-outline'
    },
    sections = {
        lualine_a = { {
            'mode',
            color = { gui = 'none' }
        } },
        lualine_c = {
            'filename',
            { gps.get_location, cond = gps.is_available }
        },
        lualine_z = { {
            'location',
            color = { gui = 'none' }
        } }
    },
    tabline = {
        lualine_a = { {
            'buffers',
            mode = 4,
            buffers_color = {
                active = { gui = 'none' },
            },
        } },
        lualine_y = { window },
        lualine_z = { 'tabs' },
    },
}
