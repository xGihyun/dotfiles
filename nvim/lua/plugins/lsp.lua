return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {
        filetypes = { "php", "html" },
      },
      phpactor = {
        init_options = {
          ["language_server_phpstan.enabled"] = false,
          ["language_server_psalm.enabled"] = false,
        },
      },
    },
  },
}
