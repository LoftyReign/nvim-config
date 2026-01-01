return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Ripgrep dir" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>th", function()
			builtin.colorscheme(themes.get_dropdown({
				enable_preview = true,
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Search and apply Themes" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzily search in the current buffer" })

		vim.keymap.set("n", "<leader>pn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search neovim files" })
	end,
}
