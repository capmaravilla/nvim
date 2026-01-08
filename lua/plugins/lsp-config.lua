return {
	-- Mason: gestor de binarios
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	-- Puente Mason ↔ LSP
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"eslint",
				"pyright",
				"ts_ls",
				"jsonls",
				"html",
				"cssls",
			},
		},
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			vim.lsp.enable({
				"lua_ls",
				"eslint",
				"pyright",
				"ts_ls",
				"jsonls",
				"html",
				"cssls",
			})

			-- Desactivar formateo vía LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end
				end,
			})
		end,
	},

	-- Formatters (conform)
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},
		},
	},
}
