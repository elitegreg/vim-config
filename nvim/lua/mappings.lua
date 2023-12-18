local map = vim.keymap.set

options = { noremap = true }
map('n', '<C-k>', ':bp<CR>', options)
map('i', '<C-k>', '<ESC>:bp<CR>', options)
map('n', '<C-j>', ':bn<CR>', options)
map('i', '<C-j>', '<ESC>:bn<CR>', options)
