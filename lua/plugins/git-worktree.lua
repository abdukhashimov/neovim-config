return {
  {
    "Juksuu/worktrees.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    opts = {
      log_status = true,
    },
    keys = {
      {
        "<leader>gw",
        function()
          Snacks.picker.worktrees()
        end,
        desc = "Git Worktrees",
      },
      {
        "<leader>gW",
        function()
          Snacks.picker.worktrees_new()
        end,
        desc = "Create Git Worktree",
      },
      {
        "<leader>gD",
        function()
          Snacks.picker.worktrees_remove()
        end,
        desc = "Remove Git Worktree",
      },
    },
  },
}
