-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.relativenumber = false
-- in your LSP config
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.diagnostic.enable(false, { bufnr = 0 }) -- disable for sqlc files
    end,
})

local function use_four_space_typescript_indent()
    if vim.bo.filetype ~= "typescript" and vim.bo.filetype ~= "typescriptreact" then
        return
    end

    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
    pattern = { "typescript", "typescriptreact", "*.ts", "*.tsx" },
    callback = function()
        vim.schedule(use_four_space_typescript_indent)
    end,
})
