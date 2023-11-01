return {
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = true,
  --   opts = {
  --     style = "warmer",
  --     transparent = true,
  --   },
  -- },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    opts = {
      filter = "spectrum",
      transparent_background = true,
      devicons = true,
    },
  },
  -- "folke/tokyonight.nvim",
  -- opts = {
  --   style = "storm",
  --   transparent = true,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavor = "mocha",
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
