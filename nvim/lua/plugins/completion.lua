return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
    },

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
      -- sources = {
      --   per_filetype = {
      --     markdown = { "markview" },
      --   },
      -- },
      snippets = {
        preset = "luasnip",
      },
      cmdline = {
        keymap = {
          preset = "none",
        },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = false,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "single",
          },
        },
        menu = {
          border = "single",
        },
        list = {
          selection = {
            preselect = true,
          },
        },
      },
    },
  },
}
