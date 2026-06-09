return {
    {
        "mfussenegger/nvim-lint",
        optional = true,
        opts = function(_, opts)
            opts.linters_by_ft = opts.linters_by_ft or {}

            -- Disable linting for these filetypes
            opts.linters_by_ft.sql = {}
            opts.linters_by_ft.markdown = {}
            opts.linters_by_ft["markdown.mdx"] = {}
            opts.linters_by_ft.mysql = {}
            opts.linters_by_ft.plsql = {}

            -- Keep custom phpcs config
            opts.linters.phpcs = {
                args = {
                    "--standard=PSR12",
                    "--exclude=Squiz.WhiteSpace.ScopeClosingBrace.ContentBefore",
                    "-q",
                    "--report=json",
                    "-",
                },
            }
        end,
    },
}
