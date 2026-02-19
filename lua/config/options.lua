-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
-- in your LSP config
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.diagnostic.disable(0) -- disable for sqlc files
  end,
})
