require('telescope').setup {
    defaults = {
        file_ignore_patterns = { 'tmp', 'undodir' }
    }
}
require('telescope').load_extension('fzf')

local telescope = require 'telescope.builtin'
local map = vim.keymap.set

map('n', '<leader>ff', function()
    telescope.find_files()
end, { desc = 'Telescope - find file' })

map('n', '<leader>fg', function()
    telescope.live_grep()
end, { desc = 'Telescope - live grep' })

map('n', '<leader>fb', function()
    telescope.buffers()
end, { desc = 'Telescope - buffers' })

map('n', '<leader>fh', function()
    telescope.help_tags()
end, { desc = 'Telescope - help tags' })