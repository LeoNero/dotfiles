local tree = require('nvim-tree')

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1

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
        }
    }
}

vim.keymap.set('n', '<leader>2', function()
    tree.toggle(false, true)
end, {desc='Open/Close file tree'})

vim.keymap.set('n', '<leader>r', function()
    vim.api.nvim_command('NvimTreeRefresh')
end, {desc='Refreshes file tree'})

