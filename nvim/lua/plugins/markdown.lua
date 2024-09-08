return {
  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --   -- ft = "markdown",
  --
  --   opts = {
  --     hybrid_modes = { "n" }
  --   },
  --   dependencies = {
  --     -- You may not need this if you don't lazy load
  --     -- Or if the parsers are in your $RUNTIMEPATH
  --     "nvim-treesitter/nvim-treesitter",
  --
  --     "nvim-tree/nvim-web-devicons"
  --   },
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    name = 'render-markdown',
    opts = {
      latex = {
        enabled = true,
        converter = 'latex2text',
        highlight = 'RenderMarkdownMath',
        top_pad = 0,
        bottom_pad = 0,
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    'renerocksai/telekasten.nvim',
    config = function()
      require('telekasten').setup({
        home = vim.fn.expand("~/Documents/Notes/zettelkasten"),
      })
    end,
    dependencies = { 'nvim-telescope/telescope.nvim', "nvim-telekasten/calendar-vim" }
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Notes/zettelkasten",
        },
        {
          name = "academics",
          path = "~/Documents/Notes/academics",
        },
        {
          name = "leetcode",
          path = "~/Documents/Notes/leetcode",
        },
      },
      ui = {
        enable = false
      },

      -- see below for full list of options 👇
    },
  }
}
