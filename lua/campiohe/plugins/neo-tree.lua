return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		-- fill any relevant options here
	},
	keys = {
		-- Better way to do that??
		{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree", silent = true },
	},
	config = function()
		require("neo-tree").setup({})
	end,
}
