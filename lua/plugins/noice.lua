return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = { override = { "vim.notify" } },
		cmdline = { view = "cmdline_popup" },
		views = {
			cmdline_popup = {
				position = { row = "20%", col = "50%" },
				size = { width = 60, height = "auto" },
			},
		},
	},
}
