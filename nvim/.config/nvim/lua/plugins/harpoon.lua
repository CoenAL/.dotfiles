return {
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>a",
        function() require("harpoon"):list():add() end,
        desc = "Harpoon [A]dd",
      },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon show [e]ntries",
      },
      {
        "<A-h>",
        function() require("harpoon"):list():select(1) end,
        desc = "Harpoon jump to file 1",
      },
      {
        "<A-j>",
        function() require("harpoon"):list():select(2) end,
        desc = "Harpoon jump to file 2",
      },
      {
        "<A-k>",
        function() require("harpoon"):list():select(3) end,
        desc = "Harpoon jump to file 3",
      },
      {
        "<A-l>",
        function() require("harpoon"):list():select(4) end,
        desc = "Harpoon jump to file 4",
      },
    },
    opts = {},
  },
}
