require('mini.trailspace').setup {}
require('mini.bufremove').setup {}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*' },
    callback = function()
        MiniTrailspace.trim()
    end
})

local hightlightEnabled = true
vim.keymap.set('n', '<leader>th', function()
    if hightlightEnabled then
        MiniTrailspace.unhighlight()
        hightlightEnabled = false
    else
        MiniTrailspace.highlight()
        hightlightEnabled = true
    end
end, { desc = 'Toggles trailing space highlighting' })

vim.keymap.set('n', '<leader>bd', function()
    if vim.v.count == 0 then
        vim.api.nvim_command('bd')
    else
        vim.api.nvim_command('bd ' .. vim.v.count)
    end
end, { desc = 'Closes current buffer - does not preserve window layout' })

vim.keymap.set('n', '<leader>bc', function()
    if vim.v.count > 0 then
        MiniBufremove.delete(vim.v.count, false)
    else
        MiniBufremove.delete(0, false)
    end
end, { desc = 'Closes buffer - preserves window layout' })
