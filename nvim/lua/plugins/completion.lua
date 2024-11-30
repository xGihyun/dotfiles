return {
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

      trigger = {
        completion = {
          show_on_insert_on_trigger_character = false,
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
      },
    },
    opts_extend = { "sources.completion.enabled_providers" },
  },
}
