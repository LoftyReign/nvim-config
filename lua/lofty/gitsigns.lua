return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre", -- load early when opening files
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame_opts = {
			delay = 200,
			virt_text = true,
			virt_text_pos = "eol",
		},
	},
	keys = {
		{
			"<leader>gp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview hunk",
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			desc = "Toggle blame",
		},
	},
}
