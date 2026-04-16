return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

				if not client then
					return
				end

				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
				end

				map("gn", vim.lsp.buf.rename, "Refactor Rename")
				map("ga", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("gt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
			end,
		})

		local servers = { "lua_ls", "gopls", "bash-language-server", "typos-lsp", "harper-ls", "tinymist" }
		local ensure_installed = servers
		vim.list_extend(ensure_installed, {
			"stylua",
			"goimports",
			"gofumpt",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end

		-- vim.lsp.enable("harper_ls")
		-- vim.lsp.enable("typos-lsp")
		--
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "typst",
		-- 	callback = function()
		-- 		vim.opt_local.spell = true
		-- 		vim.opt_local.spelllang = "en_us,de_de"
		-- 		vim.opt_local.textwidth = 80
		-- 	end,
		-- })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "typst",
			callback = function()
				vim.opt_local.textwidth = 80
				vim.opt_local.formatoptions:append("t")
			end,
		})
	end,
}
