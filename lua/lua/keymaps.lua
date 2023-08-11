vim.keymap.set('n', '<C-Up>', ':resize +5<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -5<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -5<CR>', opts)

vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)