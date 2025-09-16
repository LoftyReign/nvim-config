return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"bash",
				"vim",
				"vimdoc",
				"go",
				"javascript",
				"diff",
			},

			sync_installed = false,
			auto_install = true,

			highlight = {
				enable = true,
			},
		})
	end,
}
