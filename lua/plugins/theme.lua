-- Colorscheme configuration
-- (Replaces the old Omarchy symlink that pointed to a Linux-only path.)
-- Installed options: tokyonight, catppuccin, gruvbox, kanagawa, nord, rose-pine
return {
    -- Load the colorscheme eagerly, before any UI plugin renders, so the
    -- theme is applied on the very first frame (no flash of default colors).
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
