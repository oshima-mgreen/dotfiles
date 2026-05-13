return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				window = {
					width = 30,
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
					},
				},
				filesystem = {
					filtered_items = {
            visible = true,
					},
				},
			})
			-- <Space>e でツリーを開閉
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
		end,
	},

	-- カラースキーム
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
