local wilder = require('wilder')

wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        highlighter = wilder.basic_highlighter(),
        pumblend = 20,
        highlights = {
            border = 'Normal',
        },
        border = 'rounded',
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
    })),

    ['/'] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        separator = ' · ',
        left = {' ', wilder.wildmenu_spinner(), ' '},
        right = {' ', wilder.wildmenu_index()},
    }),
}))
