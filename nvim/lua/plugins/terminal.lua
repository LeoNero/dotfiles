local map = vim.keymap.set

require('toggleterm').setup()

map('t', 'jk', [[<C-\><C-n>]], { desc = 'Exits terminal mode' })

map({'n', 't'}, '<leader>otr', function()
    local term_to_toggle = ""
    if vim.v.count ~= 0 then
        term_to_toggle = vim.v.count
    end

    vim.api.nvim_command(term_to_toggle .. 'ToggleTerm')
end, { desc = 'Toggles terminal in a window' })

map({'n', 't'}, '<leader>ota', function()
    vim.api.nvim_command('ToggleTermToggleAll')
end, { desc = 'Toggles all terminals' })

map({'n', 't'}, '<leader>otf', function()
    vim.api.nvim_command('ToggleTerm direction=float')
end, { desc = 'Toggles terminal in a floating window' })

map({'n', 't'}, '<leader>ott', function()
    vim.api.nvim_command('ToggleTerm direction=tab')
end, { desc = 'Toggles terminal in a tab' })

local terminal_count = 1;
map({'n', 't'}, '<leader>otn', function()
    terminal_count = terminal_count + 1
    vim.api.nvim_command(terminal_count .. "ToggleTerm")
end, { desc = 'Toggles a new terminal in a new window' })

-- navigate splits when in terminal mode
map('t', '<C-h>', [[<C-\><C-n><C-W>h]], { desc = 'Goes to split to the left of current one' })
map('t', '<C-l>', [[<C-\><C-n><C-W>l]], { desc = 'Goes to split to the right of current one' })
map('t', '<C-k>', [[<C-\><C-n><C-W>k]], { desc = 'Goes to split above the current one' })
map('t', '<C-j>', [[<C-\><C-n><C-W>j]], { desc = 'Goes to split below the current one' })
