return {
  -- {
  --     "williamboman/mason.nvim",
  --     config = function()
  --         require("mason").setup()
  --     end,
  -- },
  -- {
  --     "williamboman/mason-lspconfig.nvim",
  --     config = function()
  --         require("mason-lspconfig").setup({
  --             ensure_installed = {
  --                 "lua_ls",
  --                 "rust_analyzer",
  --                 "svelte",
  --                 "tailwindcss",
  --                 "tsserver",
  --                 -- "ts_ls",
  --                 "eslint",
  --                 "html",
  --                 "cssls",
  --                 "jdtls",
  --                 "biome",
  --                 "gopls",
  --                 "zls",
  --                 "astro",
  --                 "pylsp",
  --                 "ruff",
  --                 "ruff_lsp",
  --                 "biome",
  --             },
  --         })
  --     end,
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- local lspconfig = require("lspconfig")
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --
      -- lspconfig.pylsp.setup({ capabilities = capabilities })
      -- lspconfig.ruff.setup({ capabilities = capabilities })
      -- lspconfig.ruff_lsp.setup({ capabilities = capabilities })
      -- lspconfig.clangd.setup({ capabilities = capabilities })
      -- lspconfig.csharp_ls.setup({ capabilities = capabilities })
      -- lspconfig.ruby_lsp.setup({ capabilities = capabilities })
      -- lspconfig.zls.setup({ capabilities = capabilities })
      -- lspconfig.gleam.setup({ capabilities = capabilities })
      -- lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      -- lspconfig.svelte.setup({ capabilities = capabilities })
      -- lspconfig.tailwindcss.setup({ capabilities = capabilities })
      -- lspconfig.ts_ls.setup({ capabilities = capabilities })
      -- lspconfig.eslint.setup({ capabilities = capabilities })
      -- lspconfig.phpactor.setup({ capabilities = capabilities })
      -- lspconfig.html.setup({ capabilities = capabilities })
      -- lspconfig.cssls.setup({ capabilities = capabilities })
      -- lspconfig.jdtls.setup({ capabilities = capabilities })
      -- lspconfig.astro.setup({ capabilities = capabilities })
      -- lspconfig.volar.setup({ capabilities = capabilities })
      -- lspconfig.gopls.setup({ capabilities = capabilities })
      -- lspconfig.biome.setup({ capabilities = capabilities })
      -- lspconfig.marksman.setup({ capabilities = capabilities })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        pylsp = {},
        ruff = {},
        ruff_lsp = {},
        clangd = {},
        csharp_ls = {},
        ruby_lsp = {},
        zls = {},
        gleam = {},
        lua_ls = {},
        rust_analyzer = {},
        svelte = {},
        tailwindcss = {},
        ts_ls = {},
        eslint = {},
        phpactor = {},
        html = {},
        cssls = {},
        jdtls = {},
        astro = {},
        volar = {},
        gopls = {},
        biome = {},
        marksman = {},
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
      })

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            -- "tsserver" will be depracted, so change it to "ts_ls" until it gets updated
            if server_name == "tsserver" then
              server_name = "ts_ls"
            end

            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local telescope = require("telescope.builtin")
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Enable completion triggered by <c-x><c-o>
          -- vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = event.buf }
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

          -- The following two autocommands are used to highlight references of the
          -- word under the cursor when the cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When the cursor is moved, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- Toggle inlay hints if the LSP supports it
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
          end
        end,
      })
    end,
  },
}
