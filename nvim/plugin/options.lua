-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

local opt = vim.opt

opt.colorcolumn = "80"

-- opt.guicursor = ""
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.undofile = true

-- Best for search settings
opt.smartcase = true
opt.ignorecase = true

opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.conceallevel = 2
-- opt.autoindent = true
opt.wrap = false
opt.list = false
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10
opt.hlsearch = true
