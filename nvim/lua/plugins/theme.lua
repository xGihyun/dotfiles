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
      -- vim.cmd.colorscheme("catppuccin")
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
        bg0 = { "#1b1b1b", "234" },
      }
      vim.cmd.colorscheme("gruvbox-material")

      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#32302f", fg = "#e78a4e" })
      vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#32302f" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#32302f" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#32302f" })
    end,
  },
}
