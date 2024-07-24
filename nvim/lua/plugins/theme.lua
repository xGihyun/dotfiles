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
            base = "#181825",
            -- base = "#1c1712",
            -- base = "#231f1a",
            -- blue = "#facf89",
            -- lavender = "#fedcb4",
            -- mauve = "#b8703d",
            -- green = "#c7cceb",
            -- text = "#f4e2cd",
            -- yellow = "#c6a0f6",
            -- sky = "#f5bde6",
            -- teal = "#8aadf4",
            -- pink = "#c6a0f6",
            -- sapphire = "#ee99a0",

            -- lavender = "#f7a1d2",
            -- teal = "#eb7aba",
            -- maroon = "#f5a97f"
          },
        },
      })
      -- vim.cmd.colorscheme("catppuccin")
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
    priority = 1000,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme("gruvbox-material")
    end
  },
  {
    "savq/melange-nvim",
    name = "melange",
    priority = 1000,
  },
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000
  }
}
