return {
  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = {
  --     "saadparwaiz1/cmp_luasnip",
  --     "rafamadriz/friendly-snippets",
  --   },
  -- },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-nvim-lsp",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --
  --     cmp.setup({
  --       snippet = {
  --         -- REQUIRED - you must specify a snippet engine
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-x>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --       }),
  --     })
  --   end,
  -- },

  -- NOTE: Trying out `blink.cmp`
  {
    "saghen/blink.cmp",
    lazy = false,
    -- optional: provides snippets for the snippet source
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      -- lock compat to tagged versions, if you've also locked blink.cmp to tagged versions
      { "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
    },

    version = "v0.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<C-x>"] = { "show" },
        ["<C-e>"] = { "hide" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
      },

      windows = {
        autocomplete = {
          border = "single",
        },
        documentation = {
          auto_show = true,
          border = "single",
          auto_show_delay_ms = 250,
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
    opts_extend = { "sources.completion.enabled_providers" },
  },
}
