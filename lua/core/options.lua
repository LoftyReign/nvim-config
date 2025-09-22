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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
