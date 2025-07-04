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
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_colors_override = {
        bg0 = { "#171717", "234" },
        fg1 = { "#d6c5a9", "234" },
        -- red = { "#943838", "234" },
        -- bg_red = { "#943838", "234" },
        red = { "#932f12", "234" },
        bg_red = { "#932f12", "234" },
        green = { "#97724C", "234" },
        bg_green = { "#97724C", "234" },
        blue = { "#807B80", "234" },
        purple = { "#C3A973", "234" },
        aqua = { "#849966", "234" },
      }

      -- vim.g.gruvbox_material_colors_override = {
      --   bg0 = { "#171717", "234" },
      --   bg1 = { "#242424", "234" },
      --   bg2 = { "#242424", "234" },
      --   bg3 = { "#404040", "234" },
      --   bg4 = { "#404040", "234" },
      --   bg5 = { "#545454", "234" },
      --   fg0 = { "#b5b5b5", "234" },
      --   fg1 = { "#bfbfbf", "234" },
      --   red = { "#666666", "234" },
      --   bg_red = { "#666666", "234" },
      --   green = { "#737373", "234" },
      --   bg_green = { "#737373", "234" },
      --   blue = { "#7d7d7d", "234" },
      --   purple = { "#9c9c9c", "234" },
      --   aqua = { "#808080", "234" },
      --   yellow = { "#969696", "234" },
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
      -- vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#333333", fg = "#e78a4e" })
      -- vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#333333" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333333" })
      -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#333333" })
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
