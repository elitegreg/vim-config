local map = vim.keymap.set

options = { noremap = false }
map('n', '<C-k>', ':BufferPrevious<CR>', options)
map('i', '<C-k>', '<ESC>:BufferPrevious<CR>', options)
map('n', '<C-j>', ':BufferNext<CR>', options)
map('i', '<C-j>', '<ESC>:BufferNext<CR>', options)
