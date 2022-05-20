local specs = require('specs')

specs.setup {
    show_jumps = false;
    min_jump = 40,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 15, -- time increments used for fade/resize effects 
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 50,
        winhl = "PMenu",
        fader = specs.linear_fader,
        resizer = specs.shrink_resizer
    },
    ignore_buftypes = {
        nofile = true,
    }
}

vim.keymap.set('n', '<leader>bb', function()
    specs.show_specs()
end, {
    silent = true,
    desc='Highlights where the cursor is'
})
