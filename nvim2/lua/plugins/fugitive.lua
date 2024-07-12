return {
	{
		"tpope/vim-fugitive",
		event = { "BufEnter" },
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git (fugitive)" })
		end,
	},
}
