require("symbols-outline").setup()

local is_vista_open = false
vim.keymap.set('n', '<leader>1', function()
    if is_vista_open then
        vim.api.nvim_command('Vista!!')
        is_vista_open = false
    else
        vim.api.nvim_command('Vista nvim_lsp')
        is_vista_open = true
    end
end, { desc = 'Open/Close symbols outline 1' })

vim.keymap.set('n', '<leader>3', function()
    vim.api.nvim_command('SymbolsOutline')
end, { desc = 'Open/Close symbols outline 2' })
