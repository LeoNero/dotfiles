vim.keymap.set('n', '<leader>3', function()
    vim.api.nvim_command('SymbolsOutline')
end, {desc='Open/Close symbols outline'})
