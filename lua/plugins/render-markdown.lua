return {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        -- never reveal raw markdown, not even on the cursor line
        anti_conceal = { enabled = false },
        -- render in every mode (insert included), read-only feel
        render_modes = true,

        -- style
        heading = {
            sign = false,
            position = "inline",
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            width = "block",
            left_pad = 0,
            right_pad = 2,
            border = false,
        },
        code = {
            sign = false,
            style = "full", -- language icon + name above block
            width = "block",
            left_pad = 2,
            right_pad = 2,
            border = "thin",
        },
        bullet = {
            icons = { "●", "○", "◆", "◇" },
        },
        checkbox = {
            enabled = true,
            unchecked = { icon = "󰄱 " },
            checked = { icon = "󰱒 " },
        },
        quote = { icon = "▋" },
        pipe_table = { preset = "round" },
        sign = { enabled = false },
    },
}
