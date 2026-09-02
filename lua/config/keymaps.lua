-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open lazygit (root dir) in a floating terminal
vim.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Lazygit (Root Dir)" })
