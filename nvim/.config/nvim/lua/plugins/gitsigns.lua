return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_", show_count = true },
        topdelete = { text = "‾", show_count = true },
        changedelete = { text = "~", show_count = true },
      },
    },
  },
}
