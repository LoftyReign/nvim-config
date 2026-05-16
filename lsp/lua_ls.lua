return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	settings = {
		Lua = {
			telemetry = {
				enable = false,
			},
			diagnostics = {
				globals = { "vim", "hl" },
			},
			workspace = {
				library = {
					"/usr/share/hypr/stubs",
				},
			},
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}
