return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1001,
	config = function()
		require("rose-pine").setup({
			variant = "main",
		})

		-- This is just here because I did not want to set it up as its own plugin for now
		--
		local theme_file = vim.fn.stdpath("data") .. "/last_colortheme.txt"
		local default_theme = "rose-pine"

		local function make_transparent()
			vim.o.termguicolors = true

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		local function set_colorscheme(theme)
			local ok, err = pcall(vim.cmd.colorscheme, theme)
			make_transparent()

			if not ok then
				print("Failed to load colorscheme '" .. theme .. "': " .. err)
			end
			return ok
		end

		local function load_colorscheme()
			local theme
			local file = io.open(theme_file, "r")
			if file then
				theme = file:read()
				file:close()
			end

			if not theme or #theme == 0 then
				theme = default_theme
			end

			if not set_colorscheme(theme) and theme ~= default_theme then
				set_colorscheme(default_theme)
			end
		end

		local function save_colorscheme(scheme)
			local file = io.open(theme_file, "w")
			if file then
				file:write(scheme)
				file:close()
			end
		end

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				save_colorscheme(vim.g.colors_name)
				make_transparent()
			end,
		})

		load_colorscheme()
	end,
}
