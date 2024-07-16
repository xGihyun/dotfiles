return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        color_overrides = {
          mocha = {
            base = "#15031d",
            -- blue = "#ef8fc6",
            -- yellow = "#c6a0f6",
            -- lavender = "#dab7f8",
            -- mauve = "#c65371",
            -- sky = "#f5bde6",
            -- teal = "#8aadf4",
            -- pink = "#c6a0f6",
            -- green = "#b7bdf8",
            -- text = "#cad3f5",
            -- sapphire = "#ee99a0",

            -- lavender = "#f7a1d2",
            -- teal = "#eb7aba",
            -- maroon = "#f5a97f"
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      }
    }
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000
  },
  {
    "water-sucks/darkrose.nvim",
    name = "darkrose",
    lazy = false,
    priority = 1000,
  }
}
