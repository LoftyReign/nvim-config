local ft_opts = {
	typst = function()
		vim.opt_local.textwidth = 80
	end,
}

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("filetypes", { clear = true }),
	pattern = vim.tbl_keys(ft_opts),
	callback = function(ev)
		local fn = ft_opts[ev.match]
		if fn then
			fn()
		end
	end,
})
