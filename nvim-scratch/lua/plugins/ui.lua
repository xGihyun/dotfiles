return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("bufferline").setup({
        vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" }),
        vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" }),
        vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" }),
      })
    end,
    -- keys = {
    --   { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
    --   { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    --   { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
    --   { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
    --   { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
    --   { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
    --   { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
    --   { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
    --   { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
    -- },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function()
      require("mini.indentscope").setup()
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "echasnovski/mini.bufremove",
    version = false,
    config = function()
      require("mini.bufremove").setup()
    end,
  },
  -- {
  -- 	"lukas-reineke/indent-blankline.nvim",
  -- 	main = "ibl",
  -- 	opts = {
  -- 		indent = {
  -- 			char = "│",
  -- 			tab_char = "│",
  -- 		},
  -- 		scope = { enabled = false },
  -- 		exclude = {
  -- 			filetypes = {
  -- 				"help",
  -- 				"alpha",
  -- 				"dashboard",
  -- 				"neo-tree",
  -- 				"Trouble",
  -- 				"trouble",
  -- 				"lazy",
  -- 				"mason",
  -- 				"notify",
  -- 				"toggleterm",
  -- 				"lazyterm",
  -- 			},
  -- 		},
  -- 	},
  -- 	config = function()
  -- 		require("ibl").setup()
  -- 	end,
  -- },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
 ██████╗ ██╗██╗  ██╗██╗   ██╗██╗   ██╗███╗   ██╗
██╔════╝ ██║██║  ██║╚██╗ ██╔╝██║   ██║████╗  ██║
██║  ███╗██║███████║ ╚████╔╝ ██║   ██║██╔██╗ ██║
██║   ██║██║██╔══██║  ╚██╔╝  ██║   ██║██║╚██╗██║
╚██████╔╝██║██║  ██║   ██║   ╚██████╔╝██║ ╚████║
 ╚═════╝ ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        },
      }

      return opts
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
