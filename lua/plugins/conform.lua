-- ~/.config/nvim/lua/plugins/conform.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
        php = { "pint" },
        proto = { "clang_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier_4_spaces" },
        typescriptreact = { "prettier_4_spaces" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
      },
      formatters = {
        sql_formatter = {
          prepend_args = { "--language", "postgresql" },
        },
        prettier_4_spaces = {
          inherit = "prettier",
          prepend_args = { "--tab-width", "4" },
        },
      },
    },
  },
}
