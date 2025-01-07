-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local set = vim.keymap.set

-- Ergonomic keymaps
set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- set("i", "kj", "<Esc>")
-- set("i", "jk", "<Esc>")

-- Tabbing in visual mode
set("v", ">", ">gv")
set("v", "<", "<gv")

-- Diagnostic keymaps
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Control the size of splits (height/width)
set("n", "<M-.>", "<c-w>5<")
set("n", "<M-,>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Kulala
set("n", "<leader>kk", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
set("n", "<leader>kj", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
set("n", "<leader>kr", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })

-- Restart LSP
set("n", "<leader>cr", "<Cmd>LspRestart<CR>")
