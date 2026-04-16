return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 300,
		spec = {
			{ "<leader>p", group = "Project" },
			{ "<leader>g", group = "Git" },
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>m", group = "Format" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Themes" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
