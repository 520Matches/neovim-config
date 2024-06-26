vim.opt.ts             = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.mouse          = 'a'
vim.opt.encoding       = 'utf-8'

vim.opt.scrolloff      = 5

vim.opt.autoindent     = true
vim.opt.number         = true
vim.opt.hlsearch       = false
vim.opt.relativenumber = true

-- or "light" if you want light mode
vim.o.background       = "dark"

-- 用<C-a>和<C-x>的时候默认是十进制
-- vim.opt.nrformats = true

-- 可以和系统的剪贴板共用,unnamed是*寄存器,unnamedplus是+寄存器
vim.opt.clipboard    = 'unnamedplus'

-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- 当前行高亮
vim.wo.cursorline = true

vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
