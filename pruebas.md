=== error ===

Failed to run config for nvim-lspconfig
... ravi11a/AppData/Loca1/nvim/1ua/p1ugins/1sp-config-03. lua : 31 :
# stacktrace:
lua/p1ugins/1sp-config-03.1ua:31 in config
lua/config/lazy. lua : 21
init . lua:2
attempt to call field
' setup_handlers '

=== fin del error

=== archivo lsp-config-03.lua ===

return {

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		priority = 80,
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
			-- Esperar a que mason-lspconfig esté disponible
			local has_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
			if not has_mason_lsp then
				vim.notify("mason-lspconfig no está cargado", vim.log.levels.WARN)
				return
			end

			local lspconfig = require("lspconfig")

			-- Mason-lspconfig configura automáticamente todos los LSP instalados
			mason_lspconfig.setup_handlers({
				-- Handler por defecto para todos los servidores
				function(server_name)
					lspconfig[server_name].setup({})
				end,
				-- Configuración específica para lua_ls
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			})

			-- Desactivar formateo vía LSP (usar solo conform)
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
}

=== fin del archivo ===
