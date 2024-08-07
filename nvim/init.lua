vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g["pencil#conceallevel"] = 1

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
  { import = "plugins" },
})

vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

-- -- NOTE: Testing LSP, delete later
-- local client = vim.lsp.start_client {
--   name = "batolsp",
--   cmd = { "/home/gihyun/Documents/Programming/Go/bato-lsp/main" }
-- }
--
-- if not client then
--   vim.notify("Client did not work")
--   return
-- end
--
-- vim.filetype.add {
--   extension = {
--     bt = "bato"
--   }
-- }
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "bato",
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })
