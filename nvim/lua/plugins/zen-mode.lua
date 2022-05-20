require("zen-mode").setup {
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false, 
        },
        tmux = { enabled = true }
  },
}

vim.keymap.set('n', '<leader>z', function()
    require("zen-mode").toggle()
end, {desc='Toggles zen mode on/off'})
