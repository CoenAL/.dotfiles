return {
  {
    "stevearc/oil.nvim",
    keys = {
      {
        "<leader>o",
        function() require("oil").toggle_float() end,
        desc = "Toggle Oil float",
      },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      columns = {
        { "mtime", format = "%Y-%m-%d %H:%M" },
        "icon",
      },
      float = {
        border = "rounded",
        padding = 2,
        max_width = 0.6,
        max_height = 0.7,
      },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },
}
