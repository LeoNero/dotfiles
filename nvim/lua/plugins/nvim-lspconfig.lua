-- TODO take a look at https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips
-- TODO setup https://github.com/simrat39/rust-tools.nvim
-- TODO setup https://github.com/p00f/clangd_extensions.nvim

require('goto-preview').setup {}
require('trouble').setup {}

require('nvim-lsp-installer').setup {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local map = vim.keymap.set

map('n', '[d', function()
    vim.diagnostic.goto_prev()
end, { desc = 'Go to prev diagnostic' })

map('n', ']d', function()
    vim.diagnostic.goto_next()
end, { desc = 'Go to next diagnostic' })

map('n', '<leader>dl', function()
    vim.api.nvim_command("TroubleToggle document_diagnostics")
end, { desc = 'Opens diagnostics of current file in Trouble' })

map('n', '<leader>dw', function()
    vim.api.nvim_command("TroubleToggle workspace_diagnostics")
end, { desc = 'Opens diagnostics of current project in Trouble' })

local servers = {
    'asm_lsp',
    'bashls',
    'clangd',
    'cmake',
    'cssls',
    'cssmodules_ls',
    'dartls',
    'denols',
    'dockerls',
    'dotls',
    'eslint',
    'gopls',
    'hls',
    'html',
    'jdtls',
    'jsonls',
    'ltex',
    'ocamllsp',
    'opencl_ls',
    'pyright',
    'quick_lint_js',
    'reason_ls',
    'rescriptls',
    'rnix',
    -- 'rome',
    'rust_analyzer',
    'solc',
    'stylelint_lsp',
    'sumneko_lua',
    'svelte',
    'tailwindcss',
    'taplo',
    'terraformls',
    'texlab',
    'tflint',
    'tsserver',
    'vimls',
    'vuels',
    'yamlls',
}

map('n', '<leader>rn', function() vim.lsp.buf.rename() end, { desc = 'Rename node' })

local saga = require 'lspsaga'
saga.init_lsp_saga()
map('n', '<leader>D', function() require('lspsaga.signaturehelp').signature_help() end, { desc = 'See type definition' })

local goto_p = require 'goto-preview'
map('n', 'gpd', function() goto_p.goto_preview_definition() end, { desc = 'Preview definition' })
map('n', 'gpi', function() goto_p.goto_preview_implementation() end, { desc = 'Preview implementation' })
map('n', 'gP', function() goto_p.close_all_win() end, { desc = 'Closes all floating LSP windows' })

local telescope = require 'telescope.builtin'
map('n', 'gr', function() telescope.lsp_references() end, { desc = 'Go to references' })

for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = function(client)
            require 'illuminate'.on_attach(client)

            map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
            map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = true, desc = 'Go to declaration' })
            map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = true, desc = 'Hover to get info' })
            map('n', 'gi', function() vim.lsp.buf.implementation() end, { buffer = true, desc = 'Go to implementation' })
        end,
        capabilities = capabilities
    }
end

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

require('lint').linters_by_ft = {
    c = { 'clangtidy', 'flawfinder' },
    cmake = { 'cmakelint' },
    cpp = { 'clangtidy', 'flawfinder' },
    css = { 'stylelint' },
    dockerfile = { 'hadolint' },
    fennel = { 'fennel' },
    go = { 'golangcilint', 'revive' },
    haskell = { 'hlint' },
    html = { 'tidy' },
    javascript = { 'eslint' },
    lua = { 'selene' },
    markdown = { 'vale', 'markdownlint' },
    nix = { 'nix', 'statix' },
    python = { 'flake8', 'mypy', 'pycodestyle', 'pydocstyle', 'pylint', 'vulture' },
    vim = { 'vint' },
    yaml = { 'yamllint' },
}

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        vim.lsp.buf.formatting()
    end
})
vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufWinEnter' }, {
    pattern = '*',
    callback = function()
        require('lint').try_lint()
    end
})


local bulb = require 'nvim-lightbulb'
local show_lightbulb = true
map('n', '<leader>db', function()
    if show_lightbulb then
        bulb.update_lightbulb({ sign = { enabled = false } })
        show_lightbulb = false

        local line = vim.api.nvim_win_get_cursor(0)[1]
        local buffer_name = vim.api.nvim_buf_get_name(0)
        vim.fn.sign_unplace('nvim-lightbulb', { id = line, buffer = buffer_name })
    else
        bulb.update_lightbulb({ sign = { enabled = true } })
        show_lightbulb = true
    end
end, { desc = 'Toggles code action lightbulb ' })
vim.api.nvim_create_autocmd('CursorMoved', {
    pattern = '*',
    callback = function()
        if show_lightbulb then
            bulb.update_lightbulb()
        end
    end
})

map('n', '<leader>ca', function()
    vim.api.nvim_command('CodeActionMenu')
end, { desc = 'Displays code action menu' })
