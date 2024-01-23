# mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

local map = vim.keymap.set

options = { noremap = true }
map('n', '<Leader>di', '<Plug>VimspectorBalloonEval', options)
map('x', '<Leader>di', '<Plug>VimspectorBalloonEval', options)
