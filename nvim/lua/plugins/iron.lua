local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
    config = {
        scratch_repl = true,
        repl_definition = {
            python = require("iron.fts.python").ipython
        },
        repl_open_cmd = view.split.vertical.botright("40%")
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
        send_motion = "<localleader>sc",
        visual_send = "<localleader>sc",
        send_file = "<localleader>sf",
        send_line = "<localleader>sl",
        send_mark = "<localleader>sm",
        mark_motion = "<localleader>mc",
        mark_visual = "<localleader>mc",
        remove_mark = "<localleader>md",
        cr = "<localleader>s<cr>",
        interrupt = "<localleader>s<space>",
        exit = "<localleader>sq",
        clear = "<localleader>cl",
    },
}

vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
