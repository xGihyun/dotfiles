return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
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
        "stylua",
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

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions

          map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
          map("gd", telescope.lsp_definitions, "[G]o to [D]efinition")
          map("gr", telescope.lsp_references, "[G]o to [R]eferences")
          map("gds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
          map("gws", telescope.lsp_dynamic_workspace_symbols, "[W]ocument [S]ymbols")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gi", telescope.lsp_implementations, "[G]o to [I]mplementation")
          -- map("<C-K>", vim.lsp.buf.signature_help, "")
          map("<space>D", telescope.lsp_type_definitions, "")
          map("<space>ca", vim.lsp.buf.code_action, "")

          -- Highlight references of the word under the cursor
          -- when it rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed

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
