return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        cmd = { "ToggleTerm", "TermSelect" },
        keys = {
            { "<leader>ot", "<cmd>1ToggleTerm direction=float name=1<cr>", desc = "Terminal 1" },
            { "<leader>o1", "<cmd>1ToggleTerm direction=float name=1<cr>", desc = "Terminal 1" },
            { "<leader>o2", "<cmd>2ToggleTerm direction=float name=2<cr>", desc = "Terminal 2" },
            { "<leader>o3", "<cmd>3ToggleTerm direction=float name=3<cr>", desc = "Terminal 3" },
            { "<leader>o4", "<cmd>4ToggleTerm direction=float name=4<cr>", desc = "Terminal 4" },
            { "<leader>os", "<cmd>TermSelect<cr>", desc = "Select terminal" },
            { "<leader>oa", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all terminals" },
        },
        opts = {
            direction = "float",
            open_mapping = [[<c-\>]],
            start_in_insert = true,
            close_on_exit = true,
            persist_size = true,
            float_opts = {
                border = "curved",
                title_pos = "center",
            },
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)

            vim.api.nvim_create_autocmd("TermOpen", {
                pattern = "term://*toggleterm#*",
                callback = function()
                    local opts = { buffer = 0 }

                    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
                    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
                    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
                    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
                    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
                end,
            })
        end,
    },
}
