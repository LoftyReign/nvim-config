return {
	cmd = { "zls" },
	filetypes = { "zig", "zir" },
	root_markers = { "build.zig", "build.zig.zon", ".git" },
	settings = {
		zls = {
			enable_semantic_tokens = true,
			enable_inlay_hints = true,
			inlay_hints_show_variable_type_hints = true,
			inlay_hints_show_parameter_name = true,
			inlay_hints_show_builtin = true,
			inlay_hints_exclude_single_argument = true,
			warn_style = true,
			enable_snippets = true,
			enable_build_on_save = true,
			build_on_save_step = "check",
		},
	},
}
