require('mini.trailspace').setup {}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern={'*'},
    callback = function()
        MiniTrailspace.trim()
    end
})

local hightlightEnabled = true

vim.keymap.set('n', '<leader>th', function()
    if highlightEnable then
        MiniTrailspace.unhighlight()
        highlightEnable = false
    else
        MiniTrailspace.highlight()
        highlightEnable = true
    end
end, {desc='Toggles trailing space highlighting'})


require('mini.misc').setup {}
