local group = vim.api.nvim_create_augroup("Snorlax", { clear = true })

    vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight on yank",
        group = group,
        callback = function()
            vim.highlight.on_yank({ timeout=200 })
        end,
    })

    vim.api.nvim_create_autocmd({ "WinEnter","BufWinEnter" },{
        desc = "Cursorline active panel",
        group = group,
        callback = function()
            vim.opt_local.cursorline = true
        end,
    })

    vim.api.nvim_create_autocmd({ "WinLeave" },{
        desc = "No cursorline inactive panel",
        group = group,
        callback = function()
            vim.opt_local.cursorline = false
        end,
    })

    vim.api.nvim_create_autocmd({ "InsertEnter" },{
        desc = "Cursorline inset-mode",
        group = group,
        callback = function()
            vim.api.nvim_set_hl(0, "cursorline", { bg = "#1E1E2E" })
        end,
    })

    vim.api.nvim_create_autocmd({ "InsertLeave" },{
        desc = "Cursorline normal-mode",
        group = group,
        callback = function()
            vim.api.nvim_set_hl(0, "cursorline", { bg = "#533f6b" })
        end,
    })
