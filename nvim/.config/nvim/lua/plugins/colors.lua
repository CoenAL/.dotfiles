return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1E1E2E" })
			vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#141424" })
			vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#1E1E2E" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#443c4d" })
			vim.api.nvim_set_hl(0, "cursorline", { bg = "#37284a" })
		end,
	},
}
