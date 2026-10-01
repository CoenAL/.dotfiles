return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind [f]iles in current project" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[f]ind by [g]rep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[f]ind open [b]uffer" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[f]ind in [h]elp doc" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[f]ind [K]eymaps" },
      {
        "<leader>fd",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "[f]ind [d]iagnostics (buffer)",
      },
      { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "[f]ind [d]iagnostics (workspace)" },
      {
        "<leader>/",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            })
          )
        end,
        desc = "[/] Fuzzily search in current buffer",
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function() return vim.fn.executable("make") == 1 end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons", enabled = true },
    },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
    end,
  },
}
