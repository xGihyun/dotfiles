return {
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      hybrid_modes = { "n" },
      list_items = {
        shift_width = 2,
      },
    },
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
      map("<leader>znd", "<Cmd>ZkNew { dir = 'daily', group = 'daily' }<CR>", "[N]ew [D]aily note")
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
