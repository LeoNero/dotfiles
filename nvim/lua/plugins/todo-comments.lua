require('todo-comments').setup {
    signs = false,
    highlight = {
        pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
        pattern = [[\b(KEYWORDS)\b]],
    },
}
