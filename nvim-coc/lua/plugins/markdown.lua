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
}
