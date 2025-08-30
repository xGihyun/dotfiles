return {
  {
    "nvim-mini/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup({})
      require("mini.indentscope").setup({})
      require("mini.icons").setup({
        file = {
          [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
        },
        filetype = {
          gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
        },
      })
      require("mini.diff").setup({
        view = {
          style = "sign",
          signs = { add = "󰐕 ", change = " ", delete = "󰍴 " },
        },
      })
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      local colors = require("nvim-highlight-colors")

      colors.setup({})
      colors.turnOff()

      vim.keymap.set("n", "<leader>tc", colors.toggle, { desc = "[T]oggle [C]olors" })
    end,
  },
}
