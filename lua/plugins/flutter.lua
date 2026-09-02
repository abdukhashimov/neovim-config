return {
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        opts = {
            closing_tags = {
                enabled = false,
            },
        },
    },
    -- Install the Dart treesitter parser. Required for fold-imports.nvim
    -- (and better syntax highlighting) to work on .dart / Flutter files.
    -- LazyVim sets opts_extend = { "ensure_installed" }, so this list is
    -- merged with the defaults rather than replacing them.
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "dart" } },
    },
}
