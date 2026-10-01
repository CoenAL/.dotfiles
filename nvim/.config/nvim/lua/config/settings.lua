vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.showmode = false -- lualine shows the mode

-- info columns setting
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local colorcolumns = {
      lua = "100",
      python = "100",
      oil = "",
      markdown = "",
    }

    local column = colorcolumns[args.match]

    if column then
      vim.opt_local.colorcolumn = column
    end
  end,
})

-- split behaviour settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- tab indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- undo settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- show effect of incremental command (like `:s`) while typing, preview
-- affected lines in split
vim.opt.inccommand = "split"
