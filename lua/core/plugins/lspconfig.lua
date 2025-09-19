return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client:supports_method("textDocument/completion") then
					vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
				end

				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
				end

				map("gn", vim.lsp.buf.rename, "Rename")
				map("ga", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
			end,
		})

		local servers = { "lua_ls" }
		local ensure_installed = vim.list_extend(servers, {
			"stylua",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
