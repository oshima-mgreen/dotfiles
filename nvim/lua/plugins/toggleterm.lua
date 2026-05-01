return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{ [[<C-\>]], desc = "ターミナル切替" },
			{ "<leader>tf", desc = "フローティングターミナル" },
			{ "<leader>th", desc = "水平ターミナル" },
			{ "<leader>tv", desc = "垂直ターミナル" },
		},
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				direction = "float",
				float_opts = { border = "curved" },
				shade_terminals = true,
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				persist_size = true,
			})

			-- ターミナルモード内で jk → ノーマルモード相当の <C-\><C-n>
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*toggleterm#*",
				callback = function()
					local opts = { buffer = 0 }
					vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
					vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
					vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
					vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
					vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				end,
			})

			vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { silent = true, desc = "フローティングターミナル" })
			vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal size=15<CR>", { silent = true, desc = "水平ターミナル" })
			vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical size=80<CR>", { silent = true, desc = "垂直ターミナル" })
		end,
	},
}
