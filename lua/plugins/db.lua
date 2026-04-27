return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_open_windows_as_floating = 1
    end,
    ft = { "sql", "mysql", "plsql" },
    config = function()
      local function get_query()
        local mode = vim.fn.mode()

        -- Visual mode: get selected text
        if mode == "v" or mode == "V" or mode == "\22" then
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.fn.getline(start_pos[2], end_pos[2])

          if #lines == 0 then
            return ""
          end

          lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
          lines[1] = string.sub(lines[1], start_pos[3])

          return table.concat(lines, "\n")
        end

        -- Normal mode: full buffer
        return table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
      end

      local function is_destructive_query(query)
        query = query:lower()

        return query:match("%f[%a]delete%f[%A]")
          or query:match("%f[%a]update%f[%A]")
          or query:match("%f[%a]drop%f[%A]")
          or query:match("%f[%a]truncate%f[%A]")
          or query:match("%f[%a]alter%f[%A]")
          or query:match("%f[%a]insert%f[%A]")
      end

      local function execute_query_with_confirm()
        local query = get_query()

        if is_destructive_query(query) then
          local choice = vim.fn.confirm("Destructive SQL detected. Execute query?", "&Yes\n&No", 2)

          if choice ~= 1 then
            vim.notify("Query cancelled", vim.log.levels.WARN)
            return
          end
        end

        vim.cmd("normal! \\<Plug>(DBUI_ExecuteQuery)")
      end

      vim.keymap.set({ "n", "v" }, "<leader>S", execute_query_with_confirm, {
        buffer = true,
        desc = "Execute SQL with destructive query confirmation",
      })
    end,
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
        },
      },
    },
  },
}
