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
            -- Gruvbox Material (Medium)
            -- crust = "#1b1b1b",
            -- mantle = "#1b1b1b",
            -- base = "#1b1b1b",
            -- surface0 = "#282828",
            -- surface1 = "#32302f",
            -- surface2 = "#45403d",
            -- overlay0 = "#7c6f64",
            -- overlay1 = "#928364",
            -- overlay2 = "#a89984",
            -- subtext0 = "#d4be98",
            -- subtext1 = "#d4be98",
            -- text = "#ddc7a1",
            -- lavender = "#7daea3",
            -- blue = "#7daea3",
            -- sapphire = "#7daea3",
            -- sky = "#7daea3",
            -- teal = "#89b482",
            -- green = "#a9b665",
            -- yellow = "#d8a657",
            -- peach = "#e78a4e",
            -- maroon = "#ea6962",
            -- red = "#ea6962",
            -- mauve = "#ea6962",
            -- flamingo = "#a89984",
            -- rosewater = "#a89984",

            -- Gruvbox Material (Hard)
            -- crust = "#141617",
            -- mantle = "#1d2021",
            -- base = "#1d2021",
            -- surface0 = "#282828",
            -- surface1 = "#3c3836",
            -- surface2 = "#504945",
            -- overlay0 = "#7c6f64",
            -- overlay1 = "#928364",
            -- overlay2 = "#a89984",
            -- subtext0 = "#d4be98",
            -- subtext1 = "#d4be98",
            -- text = "#ddc7a1",
            -- lavender = "#7daea3",
            -- blue = "#7daea3",
            -- sapphire = "#7daea3",
            -- sky = "#7daea3",
            -- teal = "#89b482",
            -- green = "#a9b665",
            -- yellow = "#d8a657",
            -- peach = "#e78a4e",
            -- maroon = "#ea6962",
            -- red = "#ea6962",
            -- mauve = "#ea6962",
            -- flamingo = "#a89984",
            -- rosewater = "#a89984",
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
    config = function()
      require("kanagawa").setup({
        colors = {
          -- palette = {
          --   sumiInk0 = "#141617",
          --   sumiInk3 = "#1b1b1b",
          -- },
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
