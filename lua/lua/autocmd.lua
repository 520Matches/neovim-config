local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- 恢复到上次关闭文件时光标所在的位置
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})
