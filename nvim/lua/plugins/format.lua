return {
  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function()
  --     local null_ls = require("null-ls")
  --     -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  --
  --     null_ls.setup({
  --       sources = {
  --         null_ls.builtins.formatting.stylua,
  --         null_ls.builtins.formatting.prettierd,
  --         null_ls.builtins.formatting.prettier,
  --         null_ls.builtins.formatting.biome,
  --         -- null_ls.builtins.formatting.rustywind,
  --       },
  --       -- Format on save
  --       -- on_attach = function(client, bufnr)
  --       --   if client.supports_method("textDocument/formatting") then
  --       --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --       --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       --       group = augroup,
  --       --       buffer = bufnr,
  --       --       callback = function()
  --       --         vim.lsp.buf.format({ async = false })
  --       --       end,
  --       --     })
  --       --   end
  --       -- end,
  --     })
  --
  --     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "[F]ormat" })
  --   end,
  -- },
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
            timeout_ms = 3000,
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
        -- Conform can also run multiple formatters sequentially
        -- python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "biome", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", "biome", stop_after_first = true },
        -- json = { "prettierd", "prettier", "biome", stop_after_first = true },
        -- astro = { "biome", "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
