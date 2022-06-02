require('auto-session').setup {
    auto_session_create_enabled = false,
    auto_session_use_git_branch = true,
}

vim.keymap.set('n', '<leader>5', function() require('session-lens').search_session() end, { desc = 'Opens list of sessions' })
