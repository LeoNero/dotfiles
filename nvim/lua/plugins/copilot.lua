vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-H>", "<Plug>(copilot-previous)", { silent = true, expr = false })
vim.api.nvim_set_keymap("i", "<C-L>", "<Plug>(copilot-next)", { silent = true, expr = false })
