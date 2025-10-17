vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Options
vim.o.colorcolumn = "100"

vim.o.guicursor = ""
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true

vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

-- vim.o.conceallevel = 2
vim.o.wrap = false
vim.o.list = false
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.hlsearch = true
vim.o.winborder = "rounded"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
vim.o.swapfile = false

vim.opt.termguicolors = true

-- Basic Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Tabbing in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"[d",
	vim.diagnostic.goto_prev,
	{ desc = "Go to previous [D]iagnostic message" }
)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set(
	"n",
	"<leader>e",
	vim.diagnostic.open_float,
	{ desc = "Show diagnostic [E]rror messages" }
)
vim.keymap.set(
	"n",
	"<leader>q",
	vim.diagnostic.setloclist,
	{ desc = "Open diagnostic [Q]uickfix list" }
)

-- Restart LSP
-- vim.keymap.set("n", "<leader>cr", "<Cmd>LspRestart<CR>")

-- Theme
vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = false,
	color_overrides = {
		mocha = {
			base = "#151414",
			mantle = "#1a191a",
			crust = "#1f1e1f",
			mauve = "#c07d8f",
			green = "#8F8898",
			sky = "#DAA69E",
			sapphire = "#8F8898",
			surface0 = "#2d2b2d",
			surface1 = "#3e3a3e",
			surface2 = "#4f4c4f",
			subtext0 = "#8F8898",
			subtext1 = "#bfbbbf",
			text = "#c6c2c6",
			blue = "#AB9BA4",
			lavender = "#c6c2c6",
			peach = "#93bdd2",
			yellow = "#AB9BA4",
		},
	},
})

vim.cmd.colorscheme("catppuccin")
vim.cmd(":hi statusline guibg=NONE")

-- Change color of cursor when using insert mode
vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#DAA69E", bg = "#DAA69E" })
vim.opt.guicursor = {
	"i-ci-ve:block-CursorInsert/lCursor",
}

-- Treesitter
vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
	},
})

require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"html",
		"json",
		"lua",
		"python",
		"javascript",
		"typescript",
		"tsx",
		"rust",
		"astro",
		"svelte",
		"markdown",
		"markdown_inline",
		"sql",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

-- Tmux
vim.pack.add({ "https://github.com/christoomey/vim-tmux-navigator" })

-- File Picker (fzf-lua)
vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", fzf.files, {})
vim.keymap.set("n", "<leader>fF", function()
	fzf.files({ no_ignore = true })
end, {})
vim.keymap.set("n", "<leader>fg", fzf.live_grep, {})
vim.keymap.set("n", "<leader>fb", fzf.buffers, {})
vim.keymap.set("n", "<leader>ft", "<Cmd>TodoFzfLua<CR>", {
	desc = "[F]ind [T]odo Notes",
})

-- Harpoon
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
})

local harpoon = require("harpoon")
harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

vim.keymap.set("n", "<leader>H", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[H]arpoon" })

-- Set <leader>1..<leader>5 as shortcuts to moving to the files
for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
	vim.keymap.set("n", string.format("<leader>%d", idx), function()
		harpoon:list():select(idx)
	end)
end

-- mini.nvim
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup({ n_lines = 500 })
require("mini.surround").setup({})
require("mini.indentscope").setup({})
require("mini.icons").setup({
	file = {
		[".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
	},
	filetype = {
		gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
	},
})
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = { add = "󰐕 ", change = " ", delete = "󰍴 " },
	},
})

local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	window = {
		delay = 0,
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
		{ mode = "n", keys = "<Leader>f", desc = "[F]ile" },
		{ mode = "n", keys = "<Leader>c", desc = "[C]ode" },
		{ mode = "n", keys = "<Leader>d", desc = "[D]ocument" },
		{ mode = "n", keys = "<Leader>d", desc = "[D]ocument" },
		{ mode = "n", keys = "<Leader>w", desc = "[W]orkspace" },
	},
})

require("mini.files").setup()

vim.keymap.set(
	"n",
	"<leader>e",
	"<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
	{ desc = "Navigate files" }
)
vim.keymap.set("n", "E", "<CMD>lua MiniFiles.open()<CR>", { desc = "Navigate files" })

-- LSP
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
})

require("mason").setup({})

vim.lsp.enable({
	"lua_ls",
	"stylua",
	"zls",
	"rust_analyzer",
	"gopls",
	"svelte",
	"tailwindcss",
	"vtsls",
	"marksman",
	"ty",
	"ruff",
	"clangd",
})

vim.lsp.config("tailwindcss", {
	root_dir = function(_, on_dir)
		local root_markers = {
			"tailwind.config.*",
			"package.json",
		}
		local root = vim.fs.find(root_markers, { upward = true })[1]
		if root then
			on_dir(vim.fs.dirname(root))
		end
	end,
})

vim.lsp.config("*", {
	on_attach = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.bufnr, desc = "LSP: " .. desc })
		end

		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", fzf.lsp_declarations, "[G]o to [D]eclaration")
		map("gd", fzf.lsp_definitions, "[G]o to [D]efinition")
		map("gi", fzf.lsp_implementations, "[G]o to [I]mplementation")
		map("gt", fzf.lsp_typedefs, "[G]o to [T]ype Definition")
		map("grr", fzf.lsp_references, "[G]o to [R]eferences")
		map("grn", vim.lsp.buf.rename, "[R]ename")
		map("<leader>ca", fzf.lsp_code_actions, "[C]ode [A]ctions")
		map("<leader>ds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>dd", fzf.diagnostics_document, "[D]ocument [D]iagnostics")
		map("<leader>ws", fzf.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>wd", fzf.diagnostics_workspace, "[W]orkspace [D]iagnostics")
	end,
})

-- Autocomplete
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = {
		preset = "default",
		["<C-x>"] = { "show" },
		["<C-e>"] = { "hide" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	cmdline = {
		keymap = {
			preset = "none",
		},
	},
	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "mono",
	},
	signature = { enabled = true },
	completion = {
		trigger = {
			show_on_insert_on_trigger_character = false,
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		list = {
			selection = {
				preselect = true,
			},
		},
	},
})

-- Snippets
vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("^2") },
})

require("luasnip.loaders.from_vscode").lazy_load()

-- Formatting
vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local web_lsp_opts = {
	"biome",
	"prettier",
	"prettierd",
	stop_after_first = true,
}

require("conform").setup({
	notify_on_error = false,
	formatters_by_ft = {
		injected = { options = { ignore_errors = true } },
		lua = { "stylua" },
		python = { "ruff_format" },
		javascript = web_lsp_opts,
		typescript = web_lsp_opts,
		typescriptreact = web_lsp_opts,
		markdown = web_lsp_opts,
		json = web_lsp_opts,
		astro = web_lsp_opts,
		svelte = web_lsp_opts,
		css = web_lsp_opts,
		cs = { "csharpier" },
		go = { "goimports", "gofumpt", "golines" },
		sh = { "shfmt" },
		yaml = { "prettierd" },
	},
	formatters = {
		csharpier = {
			command = "dotnet-csharpier",
			args = { "--write-stdout" },
		},
	},
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		async = false,
		quiet = false,
		lsp_format = "fallback",
		timeout_ms = 2000,
	})
end, { desc = "[C]ode [F]ormat" })

-- Highlight Colors
vim.pack.add({
	"https://github.com/brenoprata10/nvim-highlight-colors",
})

local colors = require("nvim-highlight-colors")

colors.setup({})
colors.turnOff()

vim.keymap.set("n", "<leader>tc", colors.toggle, { desc = "[T]oggle [C]olors" })
