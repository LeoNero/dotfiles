-- TODO take a look at https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips
-- TODO lots of duplication in this file...

require('devcontainer').setup {
    attach_mounts = {
        always = true,
        neovim_config = {
            enabled = true,
            options = { "readonly" }
        },
        neovim_data = {
            enabled = true,
            options = {}
        },
    },
}

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
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
    'ansiblels',
    'asm_lsp',
    'bashls',
    'clojure_lsp',
    'cmake',
    'cssls',
    'cssmodules_ls',
    'dartls',
    'denols',
    'dockerls',
    'dotls',
    'eslint',
    'fennel-ls',
    'gopls',
    'hls',
    'html',
    'jdtls',
    'jsonls',
    'ltex',
    'ocamllsp',
    'opencl_ls',
    'pylsp',
    --[[ 'pyright', ]]
    'quick_lint_js',
    'reason_ls',
    'rescriptls',
    'rnix',
    -- 'rome',
    'solc',
    'stylelint_lsp',
    'sumneko_lua',
    'svelte',
    --[[ 'tailwindcss', ]]
    'taplo',
    'terraformls',
    'texlab',
    'tflint',
    'tsserver',
    'vimls',
    'vuels',
    'yamlls',

    'coq_lsp',
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
    if lsp == 'hls' then
        lspconfig[lsp].setup {
            on_attach = function(client)
                require 'illuminate'.on_attach(client)

                map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
                map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = true, desc = 'Go to declaration' })
                map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = true, desc = 'Hover to get info' })
                map('n', 'gi', function() vim.lsp.buf.implementation() end,
                    { buffer = true, desc = 'Go to implementation' })
            end,
            capabilities = capabilities,
            settings = {
                haskell = {
                    hlintOn = true,
                    formattingProvider = 'fourmolu',
                }
            }
        }
    else
        lspconfig[lsp].setup {
            on_attach = function(client)
                require 'illuminate'.on_attach(client)

                map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
                map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = true, desc = 'Go to declaration' })
                map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = true, desc = 'Hover to get info' })
                map('n', 'gi', function() vim.lsp.buf.implementation() end,
                    { buffer = true, desc = 'Go to implementation' })
            end,
            capabilities = capabilities
        }
    end

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

require('idris2').setup {
    server = {
        on_attach = function(client)
            require 'illuminate'.on_attach(client)

            map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
            map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = true, desc = 'Go to declaration' })
            map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = true, desc = 'Hover to get info' })
            map('n', 'gi', function() vim.lsp.buf.implementation() end,
                { buffer = true, desc = 'Go to implementation' })

            map('n', '<leader>isi', function() require('idris2').show_implicits() end,
                { buffer = true, desc = 'Show implicits in hovers' })
            map('n', '<leader>ihi', function() require('idris2').hide_implicits() end,
                { buffer = true, desc = 'Hide implicits in hovers' })
            map('n', '<leader>ism', function() require('idris2').show_machine_names() end,
                { buffer = true, desc = 'Show machine names in hovers' })
            map('n', '<leader>ihm', function() require('idris2').hide_machine_names() end,
                { buffer = true, desc = 'Hide machine names in hovers' })
            map('n', '<leader>isf', function() require('idris2').full_namespace() end,
                { buffer = true, desc = 'Show full namespaces in hovers' })
            map('n', '<leader>ihf', function() require('idris2').hide_namespace() end,
                { buffer = true, desc = 'Hide full namespaces in hovers' })

            map('n', '<leader>irs', function() require('idris2.semantic').request() end,
                { buffer = true, desc = 'Requests semantic groups' })
            map('n', '<leader>ics', function() require('idris2.semantic').clear() end,
                { buffer = true, desc = 'Clear semantic groups' })
            map('n', '<leader>iom', function() require('idris2.metavars').request_all() end,

                { buffer = true, desc = 'Open a popup with all the metavars and jump on selection' })
            map('n', '<leader>ibn', function() require('idris2.browse').browse() end,
                { buffer = true,

                    desc = 'Asks the user for a namespace and returns the list of names visible in that namespace' })
            map('n', '<leader>ish', function() require('idris2.hover').open_split() end,
                { buffer = true, desc = 'Show hovers in a persistent split window, can show full history' })
            map('n', '<leader>ich', function() require('idris2.hover').close_split() end,
                { buffer = true, desc = 'Show hovers in the default popup' })


            map('n', '<localleader>x', function() require('idris2.repl').evaluate() end,
                { buffer = true,
                    desc = 'Prompts for an expression that the LSP should evaluate in the context of the current file. Value can be passed also directly or via visual selection, instead of prompting, and in the latter case can be substituted directly' })

            map('n', '<localleader>c', function() require('idris2.code_action').case_split() end,
                { buffer = true, desc = 'Case splits a name on the LHS, applies with no confirmation' })
            map('n', '<localleader>mc', function() require('idris2.code_action').make_case() end,
                { buffer = true, desc = 'Replaces the metavar with a case block, applies with no confirmation' })
            map('n', '<localleader>mw', function() require('idris2.code_action').make_with() end,
                { buffer = true, desc = 'Replaces the metavar with a with block, applies with no confirmation' })
            map('n', '<localleader>ml', function() require('idris2.code_action').make_lemma() end,
                { buffer = true, desc = 'Replaces the metavar with a top-level lemma, applies with no confirmation' })
            map('n', '<localleader>a', function() require('idris2.code_action').add_clause() end,
                { buffer = true, desc = 'Add a clause for a declaration, applies with no confirmation' })
            map('n', '<localleader>o', function() require('idris2.code_action').expr_search() end,
                { buffer = true, desc = 'Tries to fill a metavar, produces multiple results' })
            map('n', '<localleader>gd', function() require('idris2.code_action').generate_def() end,
                { buffer = true,
                    desc = 'Tries to build a complete definition for a declaration, produces multiple results' })
            map('n', '<localleader>rh', function() require('idris2.code_action').refine_hole() end,
                { buffer = true, desc = 'Tries to partially fill a metavar with a name' })
            map('n', '<localleader>mn', function() require('idris2.metavars').goto_next() end,
                { buffer = true, desc = 'Jumps to the next metavar in the buffer' })
            map('n', '<localleader>mp', function() require('idris2.metavars').goto_prev() end,
                { buffer = true, desc = 'Jumps to the previous metavar in the buffer' })
        end

    }
}

require('rust-tools').setup {
    hover_actions = {
        auto_focus = true,
    },
    server = {
        on_attach = function(client)
            require 'illuminate'.on_attach(client)

            map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
            map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = true, desc = 'Go to declaration' })
            map('n', 'K', function() require 'rust-tools.hover_actions'.hover_actions() end,
                { buffer = true, desc = 'Hover to get info' })
            map('n', 'gi', function() vim.lsp.buf.implementation() end, { buffer = true, desc = 'Go to implementation' })

            map('n', '<leader>rr', function() require('rust-tools.runnables').runnables() end,
                { desc = 'Enable rust runnables' })
            map('n', '<leader>re', function() require 'rust-tools.expand_macro'.expand_macro() end,
                { desc = 'Expand macros recursively' })
        end,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                    allTargets = true,
                },
                server = {
                    path = "/Users/nerone/.local/share/nvim/lsp_servers/rust_analyzer/rust_analyzer",
                },
                cargo = {
                    features = "all"
                }
            }
        }
    }
}

require('clangd_extensions').setup {
    hover_actions = {
        auto_focus = true,
    },
    server = {
        on_attach = function(client)
            require 'illuminate'.on_attach(client)

            map('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = true, desc = 'Go to definition' })
            map('n', 'gD', function() vim.lsp.buf.declaration() end, { buffer = true, desc = 'Go to declaration' })
            map('n', 'K', function() vim.lsp.buf.hover() end, { buffer = true, desc = 'Hover to get info' })
            map('n', 'gi', function() vim.lsp.buf.implementation() end, { buffer = true, desc = 'Go to implementation' })

            map('n', '<leader>rr', function() vim.api.nvim_command('ClangdTypeHierarchy') end,
                { desc = 'Shows type hierarchy' })
            -- map('n', '<leader>re', function() require 'rust-tools.expand_macro'.expand_macro() end, { desc = 'Expand macros recursively' })
        end,
        capabilities = capabilities,
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
    -- haskell = { 'hlint' },
    html = { 'tidy' },
    javascript = { 'eslint' },
    lua = { 'selene' },
    markdown = { 'vale', 'markdownlint' },
    nix = { 'nix', 'statix' },
    python = { 'flake8', 'mypy', 'pydocstyle', 'pylint', 'vulture' },
    vim = { 'vint' },
    yaml = { 'yamllint' },
}

local format_enabled = true
vim.api.nvim_create_user_command('ToggleAutoFormat', function() format_enabled = not format_enabled end, {})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        if format_enabled then
            if vim.bo.filetype == 'python' then
                vim.api.nvim_command('Black')
            else
                vim.lsp.buf.format { async = true }
            end
        end
    end
})
vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufWinEnter' }, {
    pattern = '*',
    callback = function()
        require('lint').try_lint()
    end
})


local bulb = require 'nvim-lightbulb'
local show_lightbulb = false
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
