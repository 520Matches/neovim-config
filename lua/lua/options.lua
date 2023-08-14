vim.opt.ts = 4  
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.encoding = 'utf-8'

vim.opt.scrolloff = 5

vim.opt.autoindent = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.relativenumber = true

-- 用<C-a>和<C-x>的时候默认是十进制
-- vim.opt.nrformats = true

-- 可以和系统的剪贴板共用,unnamed是*寄存器,unnamedplus是+寄存器
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = ' '

-- 普通模式下用块状光标，在插入模式下用条状光标（形状类似英文 "I" 的样子），然后在替换模式中使用下划线形状的光标


-- 恢复到上次关闭文件时光标所在的位置


-- 当前行高亮