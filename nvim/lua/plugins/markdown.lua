return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    name = "render-markdown",
    ft = "markdown",
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
    event = "VimEnter",
    ft = "markdown",
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
        picker = "fzf_lua",
      })
    end,
  },
}
