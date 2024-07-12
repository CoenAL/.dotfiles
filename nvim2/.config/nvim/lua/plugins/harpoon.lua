return {
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VimEnter",
		config = function()
			require("harpoon"):setup()
			local harpoon = require("harpoon")
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon [A]dd." })
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon show [e]ntries" })
			vim.keymap.set("n", "<A-h>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon jump to file 1" })
			vim.keymap.set("n", "<A-j>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon jump to file 2" })
			vim.keymap.set("n", "<A-k>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon jump to file 3" })
			vim.keymap.set("n", "<A-l>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon jump to file 4" })
		end,

		--- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
		opts = {},
		-- config = function()
		--     require("harpoon"):setup()
		-- end,
	},
}
