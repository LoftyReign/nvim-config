local prose_group = vim.api.nvim_create_augroup("prose-wrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = prose_group,
	pattern = { "markdown", "text", "gitcommit", "typst" },
	callback = function()
		-- Auto hard-wrap new text as you type, enable gq
		vim.opt_local.formatoptions:append("tq")

		-- Toggle auto hard-wrap while typing
		vim.api.nvim_buf_create_user_command(0, "WrapToggle", function()
			local fo = vim.opt_local.formatoptions:get()
			if fo.t then
				vim.opt_local.formatoptions:remove("t")
				vim.notify("Auto-wrap OFF", vim.log.levels.INFO)
			else
				vim.opt_local.formatoptions:append("t")
				vim.notify("Auto-wrap ON", vim.log.levels.INFO)
			end
		end, { desc = "Toggle auto hard-wrap at textwidth" })
	end,
})
