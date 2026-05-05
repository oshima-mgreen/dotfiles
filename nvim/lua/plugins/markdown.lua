return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install_sync"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { silent = true, desc = "Markdown プレビュー切替" })
		end,
	},
}
