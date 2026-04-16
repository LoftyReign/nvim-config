vim.o.clipboard = "unnamedplus"

vim.o.scrolloff = 10

vim.o.number = true
vim.o.relativenumber = true

vim.o.textwidth = 80
vim.o.colorcolumn = "+1"

vim.o.timeoutlen = 300

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

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Warn when a read only file is opened",
	group = vim.api.nvim_create_augroup("readonly_warn", { clear = true }),
	callback = function()
		if vim.bo.readonly and vim.bo.buftype == "" then
			vim.notify(
				"Read-only file.\n:W or to write with sudo.",
				vim.log.levels.WARN,
				{ title = "Read-only", timeout = 5000 }
			)
		end
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	desc = "Warn when a read only file is created",
	group = vim.api.nvim_create_augroup("readonly_warn", { clear = true }),
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.filewritable(dir) ~= 2 then
			vim.notify(
				"Cannot write here — permission denied.\n:W to write with sudo.",
				vim.log.levels.WARN,
				{ title = "Read-only location", timeout = 5000 }
			)
		end
	end,
})
