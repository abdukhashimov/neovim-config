return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft["sql"] = {}
      opts.linters_by_ft["mysql"] = {}
      opts.linters_by_ft["plsql"] = {}
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
