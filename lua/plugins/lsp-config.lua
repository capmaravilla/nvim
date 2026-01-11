-- ============================================
-- CONFIGURACIÓN DE LSP (LANGUAGE SERVER PROTOCOL)
-- ============================================
-- LSP proporciona autocompletado, diagnóstico, navegación de código, etc.
-- Este archivo configura Mason (gestor de LSPs), nvim-lspconfig y Conform (formateador)

return {
	-- ============================================
	-- MASON: GESTOR DE BINARIOS LSP
	-- ============================================
	-- Mason instala y gestiona los servidores LSP automáticamente
	{
		"williamboman/mason.nvim",
		opts = {
			-- Otras opciones disponibles:
			ui = {
			  icons = {
			    package_installed = "󱚝",
			    package_pending = "",
			    package_uninstalled = "󰚌",
			  },
			},
			max_concurrent_installers = 4,  -- Instalaciones en paralelo
		},
	},

	-- ============================================
	-- MASON-LSPCONFIG: PUENTE ENTRE MASON Y LSPCONFIG
	-- ============================================
	-- Conecta Mason con nvim-lspconfig para configurar automáticamente los LSPs
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				-- Lista de servidores LSP que se instalarán automáticamente
				ensure_installed = {
					"lua_ls", -- Lua Language Server (para archivos .lua)
					"eslint", -- ESLint (para JavaScript/TypeScript)
					"pyright", -- Pyright (para Python)
					"ts_ls", -- TypeScript Language Server
					"jsonls", -- JSON Language Server
					"html", -- HTML Language Server
					"cssls", -- CSS Language Server
					"marksman", -- Markdown Language Server
          "ruff", --Ruff
					-- Otros servidores LSP que puedes añadir:
					-- "rust_analyzer",  -- Rust
					-- "gopls",         -- Go
					-- "clangd",         -- C/C++
					-- "bashls",        -- Bash
					-- "dockerls",      -- Dockerfiles
					-- "yamlls",        -- YAML
				},
				-- Otras opciones:
				-- automatic_installation = true,  -- Instala automáticamente (por defecto: false)
			})
		end,
	},

	-- ============================================
	-- NVIM-LSPCONFIG: CONFIGURACIÓN DE LSP
	-- ============================================
	-- Configura los servidores LSP para que funcionen con Neovim
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			-- Lazydev proporciona autocompletado para la API de Neovim en archivos Lua
			{
				"folke/lazydev.nvim",
				ft = "lua", -- Solo se activa en archivos .lua
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Configuración global para todos los LSPs
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- Mejora las capacidades con soporte de snippets (útil para autocompletado)
			-- capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- Configuración por defecto para todos los servidores
			local default_config = {
				capabilities = capabilities,
				-- Otras opciones globales:
				-- on_attach = function(client, bufnr)
				--   -- Mapeos personalizados cuando se conecta un LSP
				-- end,
			}

			-- Espera a que mason-lspconfig esté disponible antes de configurar
			-- Usa un timer para asegurar que se carga después de la inicialización
			vim.defer_fn(function()
				local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
				if ok and mason_lspconfig and mason_lspconfig.setup_handlers then
					-- Configura cada servidor LSP instalado automáticamente
					-- IMPORTANTE: setup_handlers debe llamarse después de que mason-lspconfig esté listo
					mason_lspconfig.setup_handlers({
						-- Handler por defecto para todos los servidores
						function(server_name)
							lspconfig[server_name].setup(default_config)
						end,
						-- Puedes añadir configuraciones específicas por servidor:
						-- ["lua_ls"] = function()
						--   lspconfig.lua_ls.setup({
						--     settings = {
						--       Lua = {
						--         runtime = { version = "LuaJIT" },
						--         diagnostics = { globals = { "vim" } },
						--         workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						--       },
						--     },
						--   })
						-- end,
					})
				end
			end, 100) -- Espera 100ms para asegurar que todo esté cargado

			-- ============================================
			-- DESACTIVAR FORMATEO VÍA LSP
			-- ============================================
			-- Desactiva el formateo automático del LSP porque usamos Conform
			-- Esto evita conflictos entre diferentes formateadores
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						-- Desactiva formateo de documento completo
						client.server_capabilities.documentFormattingProvider = false
						-- Desactiva formateo de rango seleccionado
						client.server_capabilities.documentRangeFormattingProvider = false
					end
				end,
			})

			-- ============================================
			-- MAPEOS DE TECLADO PARA LSP
			-- ============================================
			-- Mapeos útiles cuando un LSP está activo en un buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					-- Mapeos locales del buffer (solo funcionan cuando hay LSP activo)
					local opts = { buffer = bufnr, noremap = true, silent = true }

					-- Ver declaración (gd ya está mapeado en telescope.lua para definiciones)
					vim.keymap.set(
						"n",
						"ld",
						vim.lsp.buf.declaration,
						vim.tbl_extend("force", opts, { desc = "Go to declaration" })
					)
					-- Ver implementación
					vim.keymap.set(
						"n",
						"li",
						vim.lsp.buf.implementation,
						vim.tbl_extend("force", opts, { desc = "Go to implementation" })
					)
					-- Ver tipo de símbolo
					vim.keymap.set(
						"n",
						"lD",
						vim.lsp.buf.type_definition,
						vim.tbl_extend("force", opts, { desc = "Go to type definition" })
					)
					-- Ver referencias
					vim.keymap.set(
						"n",
						"lr",
						vim.lsp.buf.references,
						vim.tbl_extend("force", opts, { desc = "References" })
					)
					-- Renombrar símbolo
					vim.keymap.set(
						"n",
						"<leader>ln",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Rename symbol" })
					)
					-- Ver información de código (hover)
					vim.keymap.set(
						"n",
						"lK",
						vim.lsp.buf.hover,
						vim.tbl_extend("force", opts, { desc = "Hover documentation" })
					)
					-- Ver firma de función
					-- vim.keymap.set(
					-- 	"n",
					-- 	"<C-i>",
					-- 	vim.lsp.buf.signature_help,
					-- 	vim.tbl_extend("force", opts, { desc = "Signature help" })
					-- )
					-- Acciones de código (refactor, etc.)
					vim.keymap.set(
						"n",
						"<leader>la",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "Code actions" })
					)
					-- Ver diagnósticos de la línea actual
					vim.keymap.set(
						"n",
						"<leader>ld",
						vim.diagnostic.open_float,
						vim.tbl_extend("force", opts, { desc = "Line diagnostics" })
					)
					-- -- Navegar al siguiente error
					-- vim.keymap.set(
					-- 	"n",
					-- 	"]d",
					-- 	vim.diagnostic.goto_next,
					-- 	vim.tbl_extend("force", opts, { desc = "Next diagnostic" })
					-- )
					-- -- Navegar al error anterior
					-- vim.keymap.set(
					-- 	"n",
					-- 	"[d",
					-- 	vim.diagnostic.goto_prev,
					-- 	vim.tbl_extend("force", opts, { desc = "Previous diagnostic" })
					-- )
				end,
			})
		end,
	},

	-- ============================================
	-- CONFORM: FORMATEADOR DE CÓDIGO
	-- ============================================
	-- Formatea código automáticamente usando diferentes herramientas
	-- Se activa con <leader>f (ver settings.lua)
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			-- Define qué formateador usar para cada tipo de archivo
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				-- Otros formateadores disponibles:
				-- rust = { "rustfmt" },
				-- go = { "gofmt" },
				-- sh = { "shfmt" },
				-- yaml = { "prettier" },
			},
			-- Otras opciones:
			-- format_on_save = {
			--   timeout_ms = 500,  -- Formatea automáticamente al guardar
			--   lsp_fallback = true,  -- Usa LSP si no hay formateador configurado
			-- },
			-- formatters = {
			--   prettier = {
			--     prepend_args = { "--single-quote" },  -- Opciones adicionales para prettier
			--   },
			-- },
		},
	},
}
