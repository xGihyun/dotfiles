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

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  See `:help wincmd` for a list of all window commands
-- set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Control the size of splits (height/width)
set("n", "<M-.>", "<c-w>5<")
set("n", "<M-,>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")
