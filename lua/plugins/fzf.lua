-- ============================================
-- FZF-LUA: BÚSQUEDA RÁPIDA DE ARCHIVOS Y TEXTO
-- ============================================
-- Interfaz de fzf (fuzzy finder) para Neovim
-- Permite buscar archivos, texto, buffers, etc. de forma rápida y eficiente
-- NOTA: También tienes Telescope configurado. Puedes usar el que prefieras.

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- ============================================
		-- MAPEOS PRINCIPALES
		-- ============================================
		-- Buscar archivos en el proyecto
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Files",
		},
		-- Búsqueda de texto en tiempo real (live grep)
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Grep",
		},
		-- Lista de buffers abiertos
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Buffers",
		},
		-- Buscar en la ayuda de Neovim
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "Help",
		},
		-- ============================================
		-- MAPEOS LSP (LANGUAGE SERVER PROTOCOL)
		-- ============================================
		-- Ir a la definición de un símbolo
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "Go to definition",
		},
		-- Ver todas las referencias de un símbolo
		{
			"gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "References",
		},
		-- Ver implementaciones de una interfaz/tipo
		{
			"gi",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "Implementations",
		},
		-- Ver símbolos del documento actual
		{
			"<leader>ds",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "Document symbols",
		},
		-- Otros mapeos LSP que puedes añadir:
		-- {
		--   "<leader>dw",
		--   function()
		--     require("fzf-lua").lsp_workspace_symbols()
		--   end,
		--   desc = "Workspace symbols",
		-- },
		-- {
		--   "<leader>dd",
		--   function()
		--     require("fzf-lua").lsp_document_diagnostics()
		--   end,
		--   desc = "Document diagnostics",
		-- },
	},
	opts = {
		-- ============================================
		-- CONFIGURACIÓN DE VENTANAS
		-- ============================================
		winopts = {
			height = 0.85,  -- Altura de la ventana (85% de la pantalla)
			width = 0.80,   -- Ancho de la ventana (80% de la pantalla)
			preview = {
				layout = "vertical",      -- Vista previa en vertical
				vertical = "down:50%",    -- Posición de la vista previa
			},
			-- Otras opciones de ventana:
			-- border = "rounded",         -- Borde redondeado
			-- fullscreen = false,         -- No pantalla completa
			-- title = "Fzf",             -- Título de la ventana
		},
		-- Otras opciones globales:
		-- files = {
		--   prompt = "Files> ",           -- Prompt personalizado
		--   cmd = "find . -type f",      -- Comando personalizado para buscar
		--   git_icons = true,             -- Iconos de Git
		-- },
		-- grep = {
		--   prompt = "Ripgrep> ",
		--   cmd = "rg --vimgrep",         -- Usa ripgrep para búsqueda
		-- },
		-- keymap = {
		--   fzf = {
		--     ["ctrl-a"] = "select-all",  -- Seleccionar todo
		--     ["ctrl-d"] = "deselect-all", -- Deseleccionar todo
		--   },
		-- },
	},
}
