return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
		keys = {
			{ "<leader>dv", desc = "Diffview を開く" },
			{ "<leader>dc", desc = "Diffview を閉じる" },
			{ "<leader>dh", desc = "ファイル履歴" },
			{ "<leader>dH", desc = "現在ファイルの履歴" },
		},
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					default = { layout = "diff2_horizontal" },
					merge_tool = { layout = "diff3_horizontal" },
				},
			})

			vim.keymap.set("n", "<leader>dv", "<Cmd>DiffviewOpen<CR>", { silent = true, desc = "Diffview を開く" })
			vim.keymap.set("n", "<leader>dc", "<Cmd>DiffviewClose<CR>", { silent = true, desc = "Diffview を閉じる" })
			vim.keymap.set("n", "<leader>dh", "<Cmd>DiffviewFileHistory<CR>", { silent = true, desc = "ファイル履歴" })
			vim.keymap.set("n", "<leader>dH", "<Cmd>DiffviewFileHistory %<CR>", { silent = true, desc = "現在ファイルの履歴" })
		end,
	},
}
