return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      {
        "<leader>-",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle Neo-tree",
      },
      {
        "-",
        "<cmd>Neotree focus<cr>",
        desc = "Focus Neo-tree",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
      window = {
        position = "right",
        width = 25,
      },
    },
  },
}
