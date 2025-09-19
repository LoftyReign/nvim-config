return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 100,
	config = function()
		vim.cmd("colorscheme rose-pine")
		require("rose-pine").setup({
			variant = "main",
		})
	end,
}
