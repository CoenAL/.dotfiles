-- lsp on_attach keybindings in autocmds.lua
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
      { "hrsh7th/cmp-nvim-lsp" },
      { "mason-org/mason.nvim", opts = {} },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "lua_ls",
            "bashls",
            "basedpyright",
            "ruff",
          },
        },
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            "stylua",
            "ruff",
            "shfmt",
            "prettier",
          },
        },
      },
    },

    config = function()
      require("lazydev").setup({})
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      -- Bash
      vim.lsp.config("bashls", { capabilities = capabilities })
      -- Python
      vim.lsp.config("basedpyright", { capabilities = capabilities })
      vim.lsp.config("ruff", { capabilities = capabilities })
    end,
  },
}
