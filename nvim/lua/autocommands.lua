local autocmd = vim.api.nvim_create_autocmd

autocmd('FileType', {
    pattern = 'text',
    callback = function()
        vim.opt_local.textwidth = 72
    end
})

autocmd('FileType', {
    pattern = 'changelog',
    callback = function()
        vim.opt_local.copyindent = true
        vim.opt_local.expandtab = false
        vim.opt_local.preserveindent = true
        vim.opt_local.textwidth = 66
    end
})

-- Makefiles
autocmd({'BufNewFile', 'BufRead'}, {
    pattern = 'Makefile*',
    callback = function()
        vim.opt_local.filetype = 'make'
    end
})

autocmd('FileType', {
    pattern = 'make*',
    callback = function()
        vim.opt_local.autoindent = false
        vim.opt_local.expandtab = false
    end
})

-- Python
autocmd('FileType', {
    pattern = 'python',
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end
})

autocmd('FileType', {
    pattern = 'python3',
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end
})
