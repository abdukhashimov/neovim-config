-- ~/.config/nvim/lua/plugins/conform.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
        php = { "pint" },
        proto = { "clang_format" },
      },
    },
  },
}
