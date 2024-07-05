return {
  "preservim/vim-pencil",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian Vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian Vault/**.md",
  },
}
