return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavor = "mocha",
      transparent_background = false,
      color_overrides = {
        mocha = {
          base = "#191724",
        },
      },
      -- custom_highlights = function(colors)
      --   return {
      --     -- Normal = { fg = colors.text, bg = colors.transparent_background and colors.none or colors.mantle },
      --     String = { fg = colors.flamingo },
      --   }
      -- end,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "main",
      highlight_groups = {
        ["@constructor"] = { fg = "subtle" },
        -- String = { fg = "#f6c177" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
