local map = vim.keymap.set

map('n', 'gs', '<plug>(GrepperOperator)')
map('x', 'gs', '<plug>(GrepperOperator)')

vim.g['grepper.tools'] = {"ack", "git", "grep"}
vim.g['grepper.dir'] = "repo,cwd"

vim.cmd('cabbrev Ack GrepperAck')
vim.cmd('cabbrev grep GrepperGrep')
