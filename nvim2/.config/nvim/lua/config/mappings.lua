vim.keymap.set("i", "jj", "<Esc>", { desc = "exit insert mode" })

-- save and source file
vim.keymap.set("n", "<leader><leader>x", "<cmd>w<CR><cmd>%so<CR>", { desc = "save and source current file" })

-- file explorer
vim.keymap.set("n", "<leader>-", "<cmd>Neotree toggle<CR>", { desc = "toggle neotree" })
vim.keymap.set("n", "-", "<cmd>Neotree focus<CR>", { desc = "focus neotree" })

-- pane/split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "focus window left of current" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "focus window down of current" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "focus window up of current" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "focus window right of current" })

-- search settings
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move lines around
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })

-- past last yanked (this command is slow!)
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "paste last yanked" })

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "yank to system clipboard" })

-- find and replace current word
vim.keymap.set(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "find and replace current word" }
)
