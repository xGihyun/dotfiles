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

      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        window = {
          delay = 0,
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<Leader>f", desc = "[F]ile" },
          { mode = "n", keys = "<Leader>c", desc = "[C]ode" },
          { mode = "n", keys = "<Leader>d", desc = "[D]ocument" },
          { mode = "n", keys = "<Leader>d", desc = "[D]ocument" },
          { mode = "n", keys = "<Leader>w", desc = "[W]orkspace" },
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
