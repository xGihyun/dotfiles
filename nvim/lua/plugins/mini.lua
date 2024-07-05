return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Auto pairs
			require("mini.pairs").setup()

			-- Highlight patterns
			require("mini.hipatterns").setup({
        event = "BufReadPre",
				opts = function()
					local hi = require("mini.hipatterns")
					return {
						-- custom LazyVim option to enable the tailwind integration
						tailwind = {
							enabled = true,
							ft = {
								"astro",
								"css",
								"heex",
								"html",
								"html-eex",
								"javascript",
								"javascriptreact",
								"rust",
								"svelte",
								"typescript",
								"typescriptreact",
								"vue",
							},
							-- full: the whole css class will be highlighted
							-- compact: only the color will be highlighted
							style = "full",
						},
						highlighters = {
							hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
							shorthand = {
								pattern = "()#%x%x%x()%f[^%x%w]",
								group = function(_, _, data)
									---@type string
									local match = data.full_match
									local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
									local hex_color = "#" .. r .. r .. g .. g .. b .. b

									return hi.compute_hex_color_group(hex_color, "bg")
								end,
								extmark_opts = { priority = 2000 },
							},
						},
					}
				end,
			})

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			-- local statusline = require 'mini.statusline'
			-- -- set use_icons to true if you have a Nerd Font
			-- statusline.setup { use_icons = vim.g.have_nerd_font }
			--
			-- -- You can configure sections in the statusline by overriding their
			-- -- default behavior. For example, here we set the section for
			-- -- cursor location to LINE:COLUMN
			-- ---@diagnostic disable-next-line: duplicate-set-field
			-- statusline.section_location = function()
			--   return '%2l:%-2v'
			-- end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
