return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.add({
      {
        "<leader>f",
        group = "[F]ile"
      },
      {
        "<leader>c",
        group = "[C]ode"
      },
      {
        "<leader>n",
        group = "[N]otes"
      },
      {
        "<leader>m",
        group = "[M]arkdown render"
      },
      {
        "<leader>d",
        group = "[D]ocument"
      },
      {
        "<leader>r",
        group = "[R]ename"
      },
      {
        "<leader>s",
        group = "[S]earch"
      },
      {
        "<leader>w",
        group = "[W]orkspace"
      },
      {
        "<leader>h",
        desc = "[H]arpoon"
      },
    })
  end,
}
