return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local map = vim.keymap
			local builtin = require("telescope.builtin")

            map.set("n", "<leader> ", builtin.find_files, {})
			map.set("n", "<leader>ff", builtin.find_files, {})
			map.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
