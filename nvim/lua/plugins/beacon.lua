vim.g.beacon_enable = false
vim.g.beacon_timeout = 1000
vim.g.beacon_size = 50

vim.keymap.set('n', '<leader>bb', function()
    vim.api.nvim_command('Beacon')
end, {
    silent = true,
    desc='Highlights where the cursor is'
})

