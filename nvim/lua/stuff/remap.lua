vim.g.mapleader = " "

-- keep previous paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

-- foda-se
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

-- make curr file an executable :)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- navigate through windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- create windows
vim.keymap.set("n", "<leader>v", "<C-w>v<C-w>l")
vim.keymap.set("n", "<leader>m", "<C-w>s<C-w>j")
vim.keymap.set("n", "<leader>d", "<C-w>q")

