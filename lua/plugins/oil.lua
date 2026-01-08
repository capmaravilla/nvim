return {
	"stevearc/oil.nvim",
	lazy = false, -- recomendado para que funcione sin problemas
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>o",
			function()
				require("oil").open()
			end,
			desc = "Open Oil Explorer",
		},
	},
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["<backspace>"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["g."] = "actions.toggle_hidden",
			},
		})
	end,
}
