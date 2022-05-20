require('other-nvim').setup {
    mappings = {
        {
            pattern = "/src/(.*)/.*.js$",
            target = "/src/%1/\\(*.css\\|*.scss\\)",
        },
    }
}
