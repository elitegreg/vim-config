local set = vim.opt

-- Global settings
set.autowrite = true       -- automatically save before commands like :next and :make
set.background = 'dark'
set.completeopt = 'menu,menuone,longest'
set.hidden = true		 -- Hide buffers when they are abandoned
set.history = 50
set.hlsearch = true
set.incsearch = true       -- Incremental search
set.laststatus = 2         -- Status on regardless of number of windows (airline)
set.ruler = true
set.showcmd = true         -- Show (partial) command in status line
set.showmatch = true       -- Show matching brackets
set.smarttab = true
set.termguicolors = true   -- 24-bit RGB color in terminal
set.updatetime = 300       -- ms before swapfile updated
set.writebackup = false

-- Buffer settings
set.expandtab = true
set.shiftwidth = 4
set.smartindent = true
set.softtabstop = 0
set.tabstop = 4

-- Window settings
set.number = true
set.signcolumn = 'yes'

-- Colors
vim.cmd [[colorscheme nightfox]]

-- Misc variables
vim.g['c_space_errors'] = 1
