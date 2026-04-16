return {
	cmd = { "harper-ls", "--stdio" },
	settings = {
		["harper-ls"] = {
			linters = {
				SentenceCapitalization = false,
				SpellCheck = false,
			},
			isolateEnglish = false,
			dialect = "American",
			lineLength = 80,
		},
	},
}
