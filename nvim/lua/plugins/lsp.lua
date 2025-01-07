return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

      local servers = {
        pylsp = {},
        ruff = {},
        clangd = {},
        zls = {},
        lua_ls = {},
        rust_analyzer = {},
        svelte = {},
        tailwindcss = {},
        eslint = {},
        html = {},
        cssls = {},
        astro = {},
        gopls = {
          cmd_env = { GOFUMPT_SPLIT_LONG_LINES = "on" },
          settings = {
            gopls = {
              gofumpt = true,
            },
          },
        },
        biome = {},
        marksman = {},
        vimls = {},
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
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
        group = vim.api.nvim_create_augroup("lsp-attach", {}),
        callback = function(event)
          local fzf = require("fzf-lua")
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
          map("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
          map("gi", vim.lsp.buf.implementation, "[G]o to [I]mplementation")
          map("gt", vim.lsp.buf.type_definition, "[G]o to [T]ype Definition")
          map("gr", fzf.lsp_references, "[G]o to [R]eferences")
          map("gds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
          map("gws", fzf.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<space>ca", fzf.lsp_code_actions, "[C]ode [A]ctions")

          -- Highlight references of the word under the cursor
          -- when it rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client.name == "svelte" then
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              group = vim.api.nvim_create_augroup("svelte-on-did-change-ts-or-js-file", { clear = true }),
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end

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
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
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
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
}
