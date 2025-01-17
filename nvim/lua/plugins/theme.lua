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
      -- vim.g.gruvbox_material_colors_override = {
      --   bg0 = { "#222221", "234" },
      -- }
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
