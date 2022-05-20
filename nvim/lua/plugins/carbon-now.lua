require('carbon-now').setup {
    options = {
        theme = 'material',
    },
    open_cmd = 'open -a Brave\\ Browser'
}

vim.keymap.set('v', '<leader>cn', function()
    require('carbon-now').create_snippet()
end, { silent = true, desc = 'Creates carbon-now snippet' })
