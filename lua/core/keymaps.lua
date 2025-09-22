vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next({float={source=true}})<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev({float={source=true}})<cr>")
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Toggle local troubleshoot" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

vim.o.clipboard = "unnamedplus"

vim.o.scrolloff = 10

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.expandtab = true
vim.o.shiftround = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.showcmd = true
vim.o.laststatus = 2

vim.o.signcolumn = "yes"

vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "fuzzy" }

-- Do not copy deletions into clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
