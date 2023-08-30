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

vim.keymap.set('n', 'sh', ':vsplit<CR>')
vim.keymap.set('n', 'sl', ':vsplit<CR><C-w>l')
vim.keymap.set('n', 'sj', ':split<CR><C-w>j')
vim.keymap.set('n', 'sk', ':split<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('i', '{', '{}<Left>', opts)
vim.keymap.set('i', '[', '[]<Left>', opts)
vim.keymap.set('i', '(', '()<Left>', opts)
vim.keymap.set('i', '"', '""<Left>', opts)
vim.keymap.set('i', '\'', '\'\'<Left>', opts)

-- voldikss/vim-floaterm
-- vim.keymap.set('n', '<F9>', ':FloatermNew<CR>')
-- vim.keymap.set('n', '<F10>', ':FloatermPrev<CR>')
-- vim.keymap.set('n', '<F11>', ':FloatermNext<CR>')
vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>')

-- bagrat/vim-buffet
vim.keymap.set('n', '<Tab>', ':bn<CR>')
vim.keymap.set('n', '<S-Tab>', ':bp<CR>')
