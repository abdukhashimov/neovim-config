return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["/"] = { "fuzzy_finder", config = { keep_filter_on_submit = true } },
          ["<esc>"] = "clear_filter",
        },
      },
    },
  },
}
