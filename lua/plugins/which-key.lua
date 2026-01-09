-- ============================================
-- WHICH-KEY: AYUDA VISUAL DE MAPEOS
-- ============================================
-- Muestra una ventana con todos los mapeos disponibles cuando presionas el líder
-- Muy útil para descubrir y recordar atajos de teclado

return {
	"folke/which-key.nvim",
	event = "VeryLazy",  -- Carga tarde para mejor rendimiento
	opts = {
		-- ============================================
		-- PRESET DE DISEÑO
		-- ============================================
		-- "classic": Diseño clásico
		-- "modern": Diseño moderno (actual)
		-- "helix": Diseño estilo Helix editor
		preset = "modern",
		-- Otras opciones:
		-- preset = "classic",
		-- preset = "helix",

		-- ============================================
		-- ICONOS PERSONALIZADOS
		-- ============================================
		icons = {
			rules = {
				-- Icono personalizado para comandos de Obsidian
				{ pattern = "obsidian", icon = "  ", color = "blue" },
				-- Otros iconos que puedes añadir:
				-- { pattern = "git", icon = "  ", color = "red" },
				-- { pattern = "lsp", icon = "  ", color = "green" },
				-- { pattern = "telescope", icon = "  ", color = "purple" },
			},
		},

		-- ============================================
		-- OTRAS OPCIONES
		-- ============================================
		-- triggers = "auto",  -- Cuándo mostrar which-key
		-- triggers_nowait = {
		--   -- Mapeos que no esperan más teclas
		--   "<leader>",
		--   "'",
		--   "`",
		--   '"',
		--   "c",
		--   "v",
		--   "g",
		-- },
		-- window = {
		--   border = "rounded",  -- Borde redondeado
		--   position = "bottom",  -- Posición de la ventana
		--   margin = { 1, 0, 1, 0 },  -- Márgenes
		--   padding = { 2, 2, 2, 2 },  -- Padding interno
		--   winblend = 0,  -- Transparencia
		-- },
		-- layout = {
		--   height = { min = 4, max = 25 },  -- Altura mínima/máxima
		--   width = { min = 20, max = 50 },  -- Ancho mínimo/máximo
		--   spacing = 3,  -- Espaciado entre columnas
		--   align = "left",  -- Alineación
		-- },
		-- show_help = true,  -- Muestra ayuda en la parte inferior
		-- show_keys = true,  -- Muestra las teclas
		-- plugins = {
		--   marks = true,  -- Muestra marcas
		--   registers = true,  -- Muestra registros
		--   spelling = {
		--     enabled = true,  -- Corrección ortográfica
		--     suggestions = 20,  -- Número de sugerencias
		--   },
		-- },
		-- hidden = {
		--   -- Mapeos que no se muestran en which-key
		--   "<silent>",
		--   "<cmd>",
		--   "<Cmd>",
		--   "<CR>",
		--   "call",
		--   "lua",
		--   "^:",
		--   "^ ",
		-- },
	},
	keys = {
		-- Muestra los mapeos locales del buffer actual
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		-- Otros mapeos útiles:
		-- {
		--   "<leader>wk",
		--   function()
		--     require("which-key").show()
		--   end,
		--   desc = "Show all keymaps",
		-- },
	},
}


