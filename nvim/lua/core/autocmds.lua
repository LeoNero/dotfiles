local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local agOpts = { clear = true }

-- Typescript and Javascript and JSON
local ts_js_pattern = { '*.ts', '*.js', '*.json' }
local ag_ts_js = augroup('filetype_js_ts', agOpts)
autocmd({ 'BufRead', 'BufNewFile' }, {
    group = ag_ts_js,
    pattern = ts_js_pattern,
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})
autocmd('FileType', {
    group = ag_ts_js,
    pattern = { 'javascript', 'typescript' },
    callback = function(t)
        vim.keymap.set('n', '<localleader>/', 'I//<space><esc>j$', { buffer = t.buf })
    end
})

-- Markdown
local ag_md = augroup('filetype_markdown', agOpts)
autocmd({ 'BufNewFile', 'BufRead' }, {
    group = ag_md,
    pattern = { '*.md', '*.markdown' },
    callback = function()
        vim.bo.filetype = 'ghmarkdown'
        vim.wo.wrap = true
    end
})


-- Makefile
local ag_make = augroup('filetype_make', agOpts)
autocmd({ 'BufNewFile', 'BufRead' }, {
    group = ag_make,
    pattern = 'Makefile',
    callback = function()
        vim.bo.expandtab = false
    end
})

-- C and C++
local ag_c = augroup('filetype_c_cpp', agOpts)
autocmd('FileType', {
    group = ag_c,
    pattern = { 'cpp', 'c' },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})
