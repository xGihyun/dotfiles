return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

      local servers = {
        pylsp = {},
        ruff = {},
        clangd = {},
        zls = {},
        lua_ls = {},
        rust_analyzer = {},
        svelte = {},
        tailwindcss = {
          root_dir = function(fname)
            local package_json = vim.fs.dirname(vim.fs.find("package.json", { path = fname, upward = true })[1])
            if not package_json then
              return nil
            end

            local file = io.open(package_json .. "/package.json", "r")
            if not file then
              return nil
            end

            local content = file:read("*a")
            file:close()

            if content:match('"tailwindcss"%s*:') then
              return package_json
            else
              return nil
            end
          end,
        },
        eslint = {},
        html = {},
        cssls = {},
        astro = {},
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
            },
          },
        },
        -- biome = {},
        marksman = {},
        vimls = {},
        jdtls = {},
        -- ts_ls = {},
      }

      local ensure_installed = vim.tbl_keys(servers or {})

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            -- Prevent duplicate servers
            if server_name == "jdtls" or server_name == "ts_ls" then
              return
            end

            local server = servers[server_name] or {}
            -- if server_name == "astro" or server_name == "svelte" then
            --   server.on_attach = function(client, bufnr)
            --     vim.api.nvim_create_autocmd("BufWritePost", {
            --       pattern = { "*.js", "*.ts" },
            --       callback = function(ctx)
            --         -- Here use ctx.match instead of ctx.file
            --         client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            --       end,
            --     })
            --   end
            -- end

            server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
            -- server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

            require("lspconfig")[server_name].setup(server)
          end,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local fzf = require("fzf-lua")
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", fzf.lsp_declarations, "[G]o to [D]eclaration")
          map("gd", fzf.lsp_definitions, "[G]o to [D]efinition")
          map("gi", fzf.lsp_implementations, "[G]o to [I]mplementation")
          map("gt", fzf.lsp_typedefs, "[G]o to [T]ype Definition")
          map("gr", fzf.lsp_references, "[G]o to [R]eferences")
          map("<leader>ca", fzf.lsp_code_actions, "[C]ode [A]ctions")
          map("<leader>ds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
          map("<leader>dd", fzf.diagnostics_document, "[D]ocument [D]iagnostics")
          map("<leader>ws", fzf.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<leader>wd", fzf.diagnostics_document, "[W]orkspace [D]iagnostics")

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has("nvim-0.11") == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- Highlight references of the word under the cursor
          -- when it rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
          then
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
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
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
