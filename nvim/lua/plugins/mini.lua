return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup({})
      require("mini.pairs").setup({})
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
          signs = { add = " ", change = " ", delete = " " },
        },
      })

      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
