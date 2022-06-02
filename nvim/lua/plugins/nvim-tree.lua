local tree = require('nvim-tree')

tree.setup {
    open_on_setup = true,
    open_on_setup_file = true,
    open_on_tab = true,
    update_focused_file = {
        enable = true
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true
    },
    actions = {
        open_file = {
            resize_window = true
        },
    },
    renderer = {
        highlight_opened_files = "all",
        highlight_git = true,
    },
}

vim.keymap.set('n', '<leader>2', function()
    tree.toggle(false, true)
end, {desc='Open/Close file tree'})

vim.keymap.set('n', '<leader>r', function()
    vim.api.nvim_command('NvimTreeRefresh')
end, {desc='Refreshes file tree'})

