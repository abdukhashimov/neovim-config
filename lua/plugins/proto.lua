-- Protobuf support: treesitter, buf LSP, buf lint.
-- Formatting stays on clang_format, configured in lua/plugins/conform.lua.
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "proto" } },
    },

    -- buf CLI provides both the language server (`buf lsp serve`) and the linter.
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "buf" } },
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                buf_ls = {},
            },
        },
        init = function()
            -- buf config files are not detected automatically
            vim.filetype.add({
                filename = {
                    ["buf.yaml"] = "buf-config",
                    ["buf.gen.yaml"] = "buf-config",
                    ["buf.work.yaml"] = "buf-config",
                    ["buf.policy.yaml"] = "buf-config",
                    ["buf.lock"] = "buf-config",
                },
            })
            vim.treesitter.language.register("yaml", "buf-config")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        optional = true,
        opts = function(_, opts)
            opts.linters_by_ft = opts.linters_by_ft or {}
            opts.linters_by_ft.proto = { "buf_lint" }
        end,
    },
}
