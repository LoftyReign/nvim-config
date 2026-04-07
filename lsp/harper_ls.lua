return {
	cmd = { "harper-ls", "--stdio" },
	settings = {
		["harper-ls"] = {
			linters = {
				SentenceCapitalization = false,
				SpellCheck = false,
			},
		},
	},
}
