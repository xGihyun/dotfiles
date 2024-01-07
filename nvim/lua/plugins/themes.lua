return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavor = "mocha",
      transparent_background = false,
    },
  },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000, opts = { variant = "moon" } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
