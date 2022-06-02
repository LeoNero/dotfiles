require('gitsigns').setup {
    trouble = true,
    signcolumn = false,
}

vim.g.gitblame_enabled = false
vim.keymap.set('n', '<leader>gb', function() vim.api.nvim_command('GitBlameToggle') end, { desc = 'Toggles virtual text of git blame' })

-- TODO read https://github.com/lewis6991/gitsigns.nvim and create mappings
-- TODO read https://github.com/tpope/vim-fugitive
