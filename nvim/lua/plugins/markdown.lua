return {
  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     local map = function(keys, func, desc, mode)
  --       mode = mode or "n"
  --       vim.keymap.set(mode, keys, func, { desc = "Markdown: " .. desc, noremap = true, silent = false })
  --     end
  --     local presets = require("markview.presets")
  --
  --     require("markview.extras.headings").setup()
  --     require("markview.extras.checkboxes").setup({
  --       --- When true, list item markers will
  --       --- be removed.
  --       remove_markers = true,
  --
  --       --- If false, running the command on
  --       --- visual mode doesn't change the
  --       --- mode.
  --       exit = true,
  --
  --       default_marker = "-",
  --       default_state = "x",
  --
  --       --- A list of states
  --       states = {
  --         { " ", "x" },
  --         { "-", "o", "~" },
  --       },
  --     })
  --
  --     map("<leader>mt", "<Cmd>Markview toggle<CR>", "[T]oggle")
  --     map("<leader>mT", "<Cmd>Markview toggleAll<CR>", "[T]oggle all")
  --
  --     map("<leader>mhi", "<Cmd>HeadingIncrease<CR>", "[H]eading [I]ncrease")
  --     map("<leader>mhd", "<Cmd>HeadingDecrease<CR>", "[H]eading [D]ecrease")
  --     map("<leader>mst", "<Cmd>Markview splitToggle<CR>", "[S]plit [T]oggle")
  --
  --     map("<leader>mct", "<Cmd>CheckboxToggle<CR>", "[C]heckbox [T]oggle")
  --     map("<leader>mcn", "<Cmd>CheckboxNext<CR>", "[C]heckbox [N]ext")
  --     map("<leader>mcN", "<Cmd>CheckboxNextSet<CR>", "[C]heckbox [N]extSet")
  --
  --     require("markview").setup({
  --       headings = presets.headings.glow,
  --       checkboxes = presets.checkboxes.nerd,
  --       latex = {
  --         enable = true
  --       }
  --     })
  --   end,
  -- },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    name = "render-markdown",
    opts = {
      checkbox = {
        custom = {
          important = { raw = "[!]", rendered = "󰓎 ", highlight = "DiagnosticWarn" },
        },
      },
      latex = {
        enabled = true,
        converter = "latex2text",
        highlight = "RenderMarkdownMath",
        top_pad = 0,
        bottom_pad = 0,
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
  },

  {
    "zk-org/zk-nvim",
    config = function()
      local map = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { desc = "ZK: " .. desc, noremap = true, silent = false })
      end

      map(
        "<leader>znn",
        "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
        "[N]ew [N]ote"
      )
      map("<leader>znd", "<Cmd>ZkNew { dir = 'journal/daily', group = 'daily' }<CR>", "[N]ew [D]aily note")
      map(
        "<leader>znp",
        "<Cmd>ZkNew { dir = 'projects', group = 'projects', title = vim.fn.input('Title: ') }<CR>",
        "[N]ew [P]roject note"
      )
      map("<leader>zb", "<Cmd>ZkBacklinks<CR>", "[B]acklinks")
      map("<leader>zl", "<Cmd>ZkLinks<CR>", "[L]inks")
      map("<leader>zf", "<Cmd>ZkNotes<CR>", "[F]ind notes")
      map("<leader>zt", "<Cmd>ZkTags<CR>", "[T]ags")

      require("zk").setup({
        picker = "telescope",
      })
    end,
  },
}
