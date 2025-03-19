return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    lazy = true,
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({
            async = false,
            quiet = false,
            lsp_format = "fallback",
            timeout_ms = 2000,
          })
        end,
        mode = { "n", "v" },
        desc = "[C]ode [F]ormat",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        injected = { options = { ignore_errors = true } },
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "biome", "prettier", "prettierd", stop_after_first = true },
        typescript = { "biome", "prettier", "prettierd", stop_after_first = true },
        typescriptreact = { "biome", "prettier", "prettierd", stop_after_first = true },
        markdown = { "prettier", "prettierd", "biome", stop_after_first = true },
        json = { "biome", "prettierd", "prettier", stop_after_first = true },
        astro = { "prettier", "prettierd", "biome", stop_after_first = true },
        svelte = { "prettier", "prettierd", "biome", stop_after_first = true },
        css = { "prettier", "prettierd", "biome", stop_after_first = true },
        cs = { "csharpier" },
        go = { "goimports", "gofumpt", "golines" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
        },
      },
    },
  },
}
