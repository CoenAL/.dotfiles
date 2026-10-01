return {
  "stevearc/conform.nvim",

  event = "BufWritePre",
  cmd = "ConformInfo",

  keys = {
    {
      "<leader>=",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },

  opts = {
    notify_on_error = false,

    format_on_save = function(bufnr)
      local disable_lsp_fallback = {
        c = true,
        cpp = true,
      }

      return {
        timeout_ms = 500,
        lsp_fallback = not disable_lsp_fallback[vim.bo[bufnr].filetype],
      }
    end,

    formatters_by_ft = {
      lua = { "stylua" },

      python = {
        "ruff_fix",
        "ruff_format",
      },
      bash = { "shfmt" },
      sh = { "shfmt" },
      markdown = { "prettier" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci", "-s" },
      },
    },
  },
}
