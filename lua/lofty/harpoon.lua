return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		harpoon:extend({
			UI_CREATE = function(cx)
				-- 1. Resize harpoon window to fit content
				local max_len = 0
				for _, line in ipairs(cx.contents) do
					max_len = math.max(max_len, #line)
				end
				local ideal_inner = math.max(20, math.min(max_len + 6, 50))
				local cfg = vim.api.nvim_win_get_config(cx.win_id)
				local hints_inner = 22
				local group_width = (ideal_inner + 2) + 2 + (hints_inner + 2)
				local group_col = math.floor((vim.o.columns - group_width) / 2)
				local hints_col = group_col + ideal_inner + 2 + 2
				vim.api.nvim_win_set_config(cx.win_id, {
					relative = "editor",
					row = cfg.row,
					col = group_col,
					width = ideal_inner,
					height = cfg.height,
				})
				-- 2. Spawn companion hints window to the right
				local hints = {
					"  <leader>a  Add file  ",
					"  <C-e>      Menu      ",
					"1 <C-h>      File      ",
					"2 <C-t>      File      ",
					"3 <C-n>      File      ",
					"4 <C-s>      File      ",
				}
				local hint_buf = vim.api.nvim_create_buf(false, true)
				vim.api.nvim_buf_set_lines(hint_buf, 0, -1, false, hints)
				vim.bo[hint_buf].modifiable = false
				local hint_win = vim.api.nvim_open_win(hint_buf, false, {
					relative = "editor",
					row = cfg.row,
					col = hints_col,
					width = 22,
					height = #hints,
					style = "minimal",
					border = "single",
					focusable = false,
				})
				-- 3. Close hints window when harpoon window closes
				vim.api.nvim_create_autocmd("WinClosed", {
					pattern = tostring(cx.win_id),
					once = true,
					callback = function()
						if vim.api.nvim_win_is_valid(hint_win) then
							vim.api.nvim_win_close(hint_win, true)
						end
					end,
				})
				for key, slot in pairs({ ["<C-h>"] = 1, ["<C-t>"] = 2, ["<C-n>"] = 3, ["<C-s>"] = 4 }) do
					vim.keymap.set("n", key, function()
						harpoon.ui:close_menu()
						harpoon:list():select(slot)
					end, { buffer = cx.bufnr })
				end
			end,
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add file" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Toggle menu" })
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: File 1" })
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: File 2" })
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: File 3" })
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: File 4" })
	end,
}
