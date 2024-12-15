return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>gf",
        function()
          require("conform").format({
            async = false,
            lsp_format = "fallback",
            timeout_ms = 1000,
          })
        end,
        mode = { "n", "v" },
        desc = "Code [F]ormat",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        injected = { options = { ignore_errors = true } },
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "prettierd", "biome", "prettier", stop_after_first = true },
        typescript = { "prettierd", "biome", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "biome", "prettier", stop_after_first = true },
        markdown = { "prettier", "prettierd", "biome", stop_after_first = true },
        json = { "prettier", "prettierd", "biome", stop_after_first = true },
        astro = { "prettier", "prettierd", "biome", stop_after_first = true },
        svelte = { "prettier", "prettierd", "biome", stop_after_first = true },
        cs = { "csharpier" },
        go = { "goimports", "gofumpt" },
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
