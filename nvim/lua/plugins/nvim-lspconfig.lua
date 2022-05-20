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
    'rome',
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

for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = function(client)
            require 'illuminate'.on_attach(client)
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

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        vim.lsp.buf.formatting()
    end
})
