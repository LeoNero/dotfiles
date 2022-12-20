local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.idris2 = {
    install_info = {
        url = "/Users/nerone/Documents/Projects/tests/tree-sitter-idris2",
        files = { "src/parser.c" },
    },
    filetype = "idris2", -- if filetype does not match the parser name
}

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autotag = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>sn"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>sp"] = "@parameter.inner",
            },
        },
    },
}
