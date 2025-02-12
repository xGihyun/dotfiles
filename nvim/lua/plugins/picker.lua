return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")

    vim.keymap.set("n", "<leader>ff", fzf.files, {})
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, {})
    vim.keymap.set("n", "<leader>fb", fzf.buffers, {})
    vim.keymap.set("n", "<leader>ft", "<Cmd>TodoFzfLua<CR>", {
      desc = "[F]ind [T]odo Notes",
    })
    vim.keymap.set("n", "<leader>flt", function()
      fzf.grep({ search = "- [ ]", cwd = vim.fn.getcwd() })
    end, { desc = "[F]ind [L]ist [T]odo" })
    vim.keymap.set("n", "<leader>fld", function()
      fzf.grep({ search = "- [x]", cwd = vim.fn.getcwd() })
    end, { desc = "[F]ind [L]ist [D]one" })
  end,
}
