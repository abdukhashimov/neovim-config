return {
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
            "DiffviewFileHistory",
        },
        keys = {
            {
                "<leader>gd",
                "<cmd>DiffviewOpen<cr>",
                desc = "Git Diffview",
            },
            {
                "<leader>gD",
                "<cmd>DiffviewClose<cr>",
                desc = "Close Diffview",
            },
            {
                "<leader>gh",
                "<cmd>DiffviewFileHistory %<cr>",
                desc = "Git File History",
            },
            {
                "<leader>gH",
                "<cmd>DiffviewFileHistory<cr>",
                desc = "Git Branch History",
            },
            {
                "<leader>gf",
                "<cmd>DiffviewToggleFiles<cr>",
                desc = "Toggle Diffview Files",
            },
        },
        opts = {
            enhanced_diff_hl = true,
            use_icons = true,
            view = {
                default = {
                    layout = "diff2_horizontal",
                },
                merge_tool = {
                    layout = "diff3_horizontal",
                    disable_diagnostics = true,
                },
            },
            file_panel = {
                listing_style = "tree",
                tree_options = {
                    flatten_dirs = true,
                    folder_statuses = "only_folded",
                },
                win_config = {
                    position = "left",
                    width = 35,
                },
            },
        },
    },
}
