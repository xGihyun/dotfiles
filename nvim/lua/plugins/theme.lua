return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      -- vim.g.gruvbox_material_float_style = "dim"
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
      vim.cmd.colorscheme("gruvbox-material")

      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#32302f", fg = "#e78a4e" })
      vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#32302f" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#32302f" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#32302f" })
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
