return {
	"lambdalisue/suda.vim",
	config = function()
		vim.g.suda_smart_edit = 1
		vim.api.nvim_create_user_command("W", "SudaWrite", { desc = "Write with sudo" })
	end,
}
