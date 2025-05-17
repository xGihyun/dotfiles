return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
    global_keymaps = true,
    kulala_keymaps = {
      ["Show headers"] = {
        "H",
        function()
          require("kulala.ui").show_headers()
        end,
      },
      ["Show body"] = {
        "B",
        function()
          require("kulala.ui").show_body()
        end,
      },
      ["Show headers and body"] = false,
      ["Show verbose"] = false,

      ["Show script output"] = {
        "O",
        function()
          require("kulala.ui").show_script_output()
        end,
      },
      ["Show stats"] = {
        "S",
        function()
          require("kulala.ui").show_stats()
        end,
      },
      ["Show report"] = {
        "R",
        function()
          require("kulala.ui").show_report()
        end,
      },

      ["Send WS message"] = {
        "<S-CR>",
        function()
          require("kulala.cmd.websocket").send()
        end,
        mode = { "n", "v" },
      },
      ["Interrupt requests"] = {
        "<C-c>",
        function()
          require("kulala.cmd.websocket").close()
        end,
        desc = "also: Close WS connection",
      },

      ["Next response"] = {
        "]",
        function()
          require("kulala.ui").show_next()
        end,
      },
      ["Previous response"] = {
        "[",
        function()
          require("kulala.ui").show_previous()
        end,
      },
      ["Jump to response"] = {
        "<CR>",
        function()
          require("kulala.ui").jump_to_response()
        end,
        desc = "also: Send WS message for WS connections",
      },

      ["Clear responses history"] = {
        "X",
        function()
          require("kulala.ui").clear_responses_history()
        end,
      },

      ["Show help"] = {
        "?",
        function()
          require("kulala.ui").show_help()
        end,
      },
      ["Show news"] = {
        "g?",
        function()
          require("kulala.ui").show_news()
        end,
      },
      ["Close"] = {
        "q",
        function()
          require("kulala.ui").close_kulala_buffer()
        end,
      },
    },
  },
}
