vim.keymap.set('n', '<leader>mm', function()
    vim.api.nvim_command('MinimapToggle')
end, {desc='Toggles minimap'})
