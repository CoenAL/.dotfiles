vim.keymap.set("i", "jj", "<Esc>", { desc = "exit insert mode" })

-- save and source file
vim.keymap.set(
  "n",
  "<leader><leader>x",
  "<cmd>w<CR><cmd>%so<CR>",
  { desc = "save and source current file" }
)

-- search settings
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move lines around
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })

-- past last yanked (this command is slow!)
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "paste last yanked" })
vim.keymap.set({ "x", "n" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

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
