return {
	"nvim-mini/mini.move",
	version = false,
	config = function()
		require("mini.move").setup({
			mappings = {
				down = "<S-j>",
				up = "<S-k>",
			},
		})
	end,
}
