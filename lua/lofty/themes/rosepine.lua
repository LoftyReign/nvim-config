return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1001,
	config = function()
		require("rose-pine").setup({
			variant = "main",
		})
		vim.api.nvim_exec_autocmds("User", { pattern = "rose-pine-loaded" })
	end,
}
