vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.pack.add({
	{src = "https://github.com/vague2k/vague.nvim"},
	{src = "https://github.com/stevearc/oil.nvim"},
	{src = "https://github.com/echasnovski/mini.pick"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
})

vim.lsp.enable({"lua_ls"})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

vim.o.clipboard = "unnamedplus"
-- vim.o.scrolloff = 10
-- vim.o.expandtab = true
-- vim.o.shiftround = true
-- vim.o.cursorline = true
-- vim.o.showcmd = true
-- vim.o.laststatus = 2
-- vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "fuzzy" }

-- vim.keymap.set("n", "<C-j>", function()
-- 	vim.diagnostic.jump({
-- 		count = 1,
-- 		on_jump = function()
-- 			vim.diagnostic.open_float({ source = true })
-- 		end,
-- 	})
-- end, { desc = "Next diagnostic" })
--
-- vim.keymap.set("n", "<C-k>", function()
-- 	vim.diagnostic.jump({
-- 		count = -1,
-- 		on_jump = function()
-- 			vim.diagnostic.open_float({ source = true })
-- 		end,
-- 	})
-- end, { desc = "Prev diagnostic" })
-- vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Toggle local troubleshoot" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Do not copy deletions into clipboard
-- vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
-- vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })

-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	desc = "Highlight when yanking text",
-- 	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
-- 	callback = function()
-- 		vim.hl.on_yank()
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	desc = "Warn when a read only file is opened",
-- 	group = vim.api.nvim_create_augroup("readonly_warn", { clear = true }),
-- 	callback = function()
-- 		if vim.bo.readonly and vim.bo.buftype == "" then
-- 			vim.notify(
-- 				"Read-only file.\n:W or to write with sudo.",
-- 				vim.log.levels.WARN,
-- 				{ title = "Read-only", timeout = 5000 }
-- 			)
-- 		end
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("BufNewFile", {
-- 	desc = "Warn when a read only file is created",
-- 	group = vim.api.nvim_create_augroup("readonly_warn", { clear = true }),
-- 	callback = function()
-- 		local dir = vim.fn.expand("<afile>:p:h")
-- 		if vim.fn.filewritable(dir) ~= 2 then
-- 			vim.notify(
-- 				"Cannot write here — permission denied.\n:W to write with sudo.",
-- 				vim.log.levels.WARN,
-- 				{ title = "Read-only location", timeout = 5000 }
-- 			)
-- 		end
-- 	end,
-- })
