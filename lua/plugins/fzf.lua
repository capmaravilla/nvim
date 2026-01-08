return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "Help",
		},
		-- LSP via fzf
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "Go to definition",
		},
		{
			"gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "References",
		},
		{
			"gi",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "Implementations",
		},
		{
			"<leader>ds",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "Document symbols",
		},
	},
	opts = {
		winopts = {
			height = 0.85,
			width = 0.80,
			preview = {
				layout = "vertical",
				vertical = "down:50%",
			},
		},
	},
}
