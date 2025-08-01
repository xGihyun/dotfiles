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
            base = "#181818",
            mantle = "#201e20",
            crust = "#282428",
            mauve = "#c07d8f",
            green = "#8F8898",
            sky = "#DAA69E",
            sapphire = "#8F8898",
            surface0 = "#2d2b2d",
            surface1 = "#3e3a3e",
            surface2 = "#4f4c4f",
            subtext0 = "#8F8898",
            subtext1 = "#bfbbbf",
            text = "#c6c2c6",
            blue = "#AB9BA4",
            lavender = "#c6c2c6",
            peach = "#93bdd2",
            yellow = "#AB9BA4",
          },
        },
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_colors_override = {
        bg0 = { "#171717", "234" },
        fg1 = { "#d6c5a9", "234" },
        red = { "#943838", "234" },
        bg_red = { "#943838", "234" },
        green = { "#97724C", "234" },
        bg_green = { "#97724C", "234" },
        blue = { "#807B80", "234" },
        purple = { "#C3A973", "234" },
        aqua = { "#849966", "234" },
      }

      -- vim.g.gruvbox_material_colors_override = {
      --   bg0 = { "#171717", "234" },
      --   bg1 = { "#201e20", "234" },
      --   bg2 = { "#201e20", "234" },
      --   bg3 = { "#282428", "234" },
      --   bg4 = { "#282428", "234" },
      --   bg5 = { "#514851", "234" },
      --   fg0 = { "#bfbbbf", "234" },
      --   fg1 = { "#c6c2c6", "234" },
      --   red = { "#d55d83", "234" },
      --   bg_red = { "#e383a1", "234" },
      --   green = { "#b3d4e6", "234" },
      --   bg_green = { "#b3d4e6", "234" },
      --   blue = { "#8F8898", "234" },
      --   purple = { "#AB9BA4", "234" },
      --   aqua = { "#AB9BA4", "234" },
      --   yellow = { "#b3d4e6", "234" },
      --   orange = { "#DAA69E", "234" },
      --   grey0 = { "#707070", "234" },
      --   grey1 = { "#666666", "234" },
      --   grey2 = { "#969696", "234" },
      --   bg_statusline1 = { "#333333", "234" },
      --   bg_statusline2 = { "#383838", "234" },
      --   bg_statusline3 = { "#4a4a4a", "234" },
      --   bg_current_word = { "#383838", "234" },
      -- }
      vim.cmd.colorscheme("gruvbox-material")

      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#32302f", fg = "#e78a4e" })
      vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#32302f" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#32302f" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#32302f" })
      -- vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#251825", fg = "#DAA69E" })
      -- vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#251825" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#251825" })
      -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#251825" })
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "hard"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup({
        theme = "zen", -- Load "zen" theme
        background = { -- map the value of 'background' option to a theme
          dark = "zen", -- try "ink" !
          light = "pearl",
        },
      })
    end,
  },
}
