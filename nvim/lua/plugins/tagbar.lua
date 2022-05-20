vim.keymap.set('n', '<leader>1', function()
    vim.api.nvim_command('TagbarToggle')
end, {desc='Open/Close tagbar'})
