require('marks').setup {}

vim.keymap.set('n', '<leader>sl', function()
    require("harpoon.mark").add_file()
end, { desc = 'Mark file to see later' })

vim.keymap.set('n', '<leader>4', function()
    vim.api.nvim_command('Telescope harpoon marks')
end, { desc = 'Shows list of marked files' })
