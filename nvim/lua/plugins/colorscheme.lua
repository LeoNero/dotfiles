--[[ vim.g.tokyonight_style = 'storm'
vim.cmd [[colorscheme tokyonight]]
--]]

local catppuccin = require("catppuccin")

catppuccin.setup {
    integrations = {
        nvimtree = {
            enabled = true,
            show_root = true,
        },
        lsp_saga = true,
        lsp_trouble = true,
        which_key = true,
        indent_blankline = {
            enabled = true,
        },
        neogit = true,
        ts_rainbow = true,
    }
}

vim.cmd [[colorscheme catppuccin-macchiato]]
