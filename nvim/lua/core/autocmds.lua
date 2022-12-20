local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

local agOpts = { clear = true }

-- Typescript and Javascript and JSON
local ts_js_pattern = { '*.ts', '*.js', '*.json', '*.res', '*.resi' }
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
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

-- C and C++
local ag_c = augroup('filetype_c_cpp', agOpts)
autocmd('FileType', {
    group = ag_c,
    pattern = { 'cpp', 'c' },
    callback = function()
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
    end
})

-- Haskell
local ag_hs = augroup('filetype_hs', agOpts)
autocmd('FileType', {
    group = ag_hs,
    pattern = { 'haskell' },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

-- Nix
local nix_pattern = { '*.nix' }
local ag_nix = augroup('filetype_nix', agOpts)
autocmd({ 'BufRead', 'BufNewFile' }, {
    group = ag_nix,
    pattern = nix_pattern,
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})

-- Coq
local ag_coq = augroup('filetype_coq', agOpts)
autocmd('FileType', {
    group = ag_coq,
    pattern = { 'coq' },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

-- Terraform
local ag_terraform = augroup('filetype_terraform', agOpts)
autocmd('FileType', {
    group = ag_terraform,
    pattern = { 'terraform' },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

--  Quickfix and Loclist
local ag_qf_loc = augroup('filetype_qf_loc', agOpts)
autocmd('FileType', {
    group = ag_qf_loc,
    pattern = 'qf',
    callback = function(info)
        local buf_info = vim.fn.getbufinfo(info.buf)[1].windows

        if next(buf_info) == nil then
            return
        end

        local win_id = buf_info[1]
        local win_info = vim.fn.getwininfo(win_id)[1]

        if win_info.loclist == 1 then
            map('n', '<localleader>j', function() vim.api.nvim_command('lnext') end,
                { desc = 'Goes to next item on Loclist' })
            map('n', '<localleader>k', function() vim.api.nvim_command('lprev') end,
                { desc = 'Goes to next item on Loclist' })
            map('n', '<C-c>', function() vim.api.nvim_command('lclose') end, { buffer = true, desc = 'Closes Loclist' })
        else
            map('n', '<localleader>j', function() vim.api.nvim_command('cn') end,
                { desc = 'Goes to next item on Quickfix' })
            map('n', '<localleader>k', function() vim.api.nvim_command('cp') end,
                { desc = 'Goes to next item on Quickfix' })
            map('n', '<C-c>', function() vim.api.nvim_command('cclose') end, { buffer = true, desc = 'Closes Quickfix' })
        end
    end
})

-- Coq colors
vim.cmd [[
augroup CoqtailHighlights
  autocmd!
  autocmd ColorScheme *
    \  hi def CoqtailChecked ctermbg=236 guibg=#7c7f93
    \| hi def CoqtailSent    ctermbg=237 guibg=#7c7f93
augroup END
]]
