return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "svelte",
          "tailwindcss",
          "tsserver",
          "eslint",
          "html",
          "cssls",
          "jdtls",
          "biome",
          "gopls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- NOTE: Doesn't work 
      inlay_hints = {
        enabled = true,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.zls.setup({ capabilities = capabilities })
      lspconfig.gleam.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      lspconfig.svelte.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.phpactor.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.astro.setup({ capabilities = capabilities })
      lspconfig.volar.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.biome.setup({ capabilities = capabilities })
      lspconfig.marksman.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local telescope = require("telescope.builtin")
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
          map("gd", telescope.lsp_definitions, "[G]o to [D]efinition")
          map("gr", telescope.lsp_references, "[G]o to [R]eferences")
          map("gds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
          map("gws", telescope.lsp_dynamic_workspace_symbols, "[W]ocument [S]ymbols")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gi", telescope.lsp_implementations, "[G]o to [I]mplementation")
          -- map("<C-k>", vim.lsp.buf.signature_help, "")
          map("<space>D", telescope.lsp_type_definitions, "")
          map("<space>ca", vim.lsp.buf.code_action, "")
          -- vim.keymap.set("n", "<space>f", function()
          --   vim.lsp.buf.format({ async = true })
          -- end, opts)
        end,
      })
    end,
  },
}
