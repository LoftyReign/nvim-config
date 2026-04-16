return {
	"rcarriga/nvim-notify",
	priority = 1000,
	opts = {
		timeout = 3000,
		stages = "static", -- no slide animation
		render = "default",
		max_width = 60,
	},
	config = function(_, opts)
		require("notify").setup(opts)
		vim.notify = require("notify")
	end,
}
