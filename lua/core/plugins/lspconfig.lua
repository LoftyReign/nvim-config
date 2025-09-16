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
			end,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
			},
		})
	end,
}
