return {
	{ import = "lofty.themes" },
	{ import = "lofty.mini" },
	{
		"persist_scheme",
		dir = vim.fn.stdpath("config") .. "/lua/plugins/persist_scheme",
		dependencies = { import = "lofty.themes" },
		config = function()
			require("plugins.persist_scheme").setup()
		end,
	},
}
