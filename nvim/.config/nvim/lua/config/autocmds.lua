local group = vim.api.nvim_create_augroup("Snorlax", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = group,
  callback = function() vim.hl.on_yank({ timeout = 200 }) end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  desc = "Cursorline active panel",
  group = group,
  callback = function() vim.opt_local.cursorline = true end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  desc = "No cursorline inactive panel",
  group = group,
  callback = function() vim.opt_local.cursorline = false end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  desc = "Cursorline inset-mode",
  group = group,
  callback = function() vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1E1E2E" }) end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  desc = "Cursorline normal mode",
  group = group,
  callback = function() vim.api.nvim_set_hl(0, "CursorLine", { bg = "#37284a" }) end,
})

-- ============================================================================
-- LSP attach
-- ============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure LSP Keymaps and features",
  group = group,
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, {
        buffer = event.buf,
        desc = "LSP: " .. desc,
      })
    end

    local telescope = require("telescope.builtin")
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Navigation
    map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
    map("gr", telescope.lsp_references, "[G]oto [R]eferences")
    map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
    map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    -- Symbols
    map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    -- Actions
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    -- Information
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<leader>e", vim.diagnostic.open_float, "Show diagnostic/[e]rror")

    -- Inlay hints
    if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
      map("<leader>th", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({
          bufnr = event.buf,
        })

        vim.lsp.inlay_hint.enable(not enabled, {
          bufnr = event.buf,
        })
      end, "[T]oggle Inlay [H]ints")
    end

    -- Highlight references under the cursor.
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_group =
        vim.api.nvim_create_augroup("SnorlaxLspHighlight:" .. event.buf, { clear = true })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = highlight_group,
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = highlight_group,
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })

      -- Clean up the buffer highlights group completely if the LSP detaches
      vim.api.nvim_create_autocmd("LspDetach", {
        group = group,
        buffer = event.buf,
        callback = function(detach_event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({
            group = "SnorlaxLspHighlight:" .. detach_event.buf,
            buffer = detach_event.buf,
          })
        end,
      })
    end
  end,
})
