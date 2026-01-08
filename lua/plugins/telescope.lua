return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Grep" },
		{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
		{ "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = { width = 0.8, preview_width = 0.5 },
					vertical = { height = 0.8, preview_height = 0.5 },
				},
				sorting_strategy = "ascending",
				prompt_prefix = "🔍 ",
			},
		})
	end,
}
