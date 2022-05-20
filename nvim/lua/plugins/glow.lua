vim.keymap.set('n', '<leader>mp', function()
    vim.api.nvim_command('Glow')
end, {desc='Previws markdown file'})
