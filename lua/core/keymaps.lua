vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

vim.keymap.set(
	"n",
	"<C-j>",
	"<cmd>lua vim.diagnostic.goto_next({float={source=true}})<cr>",
	{ desc = "Next diagnostic" }
)
vim.keymap.set(
	"n",
	"<C-k>",
	"<cmd>lua vim.diagnostic.goto_prev({float={source=true}})<cr>",
	{ desc = "Prev diagnostic" }
)
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Toggle local troubleshoot" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Do not copy deletions into clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })
