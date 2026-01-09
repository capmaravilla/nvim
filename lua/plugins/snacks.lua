-- ============================================
-- SNACKS.NVIM: SUITE DE UTILIDADES
-- ============================================
-- Colección de módulos útiles para Neovim
-- Incluye optimizaciones para archivos grandes, notificaciones, input mejorado, etc.

return {
	"folke/snacks.nvim",
	priority = 1000,  -- Alta prioridad (carga temprano)
	lazy = false,     -- Carga inmediatamente
	opts = {
		-- ============================================
		-- MÓDULOS HABILITADOS
		-- ============================================
		-- Optimización para archivos grandes (desactiva algunas funciones)
		bigfile = { enabled = true },
		-- Gestión rápida de archivos
		quickfile = { enabled = true },
		-- Sistema de notificaciones mejorado
		notifier = { enabled = true },
		-- Input mejorado (entrada de texto con mejor UI)
		input = { enabled = true },
		-- Toggle de funciones (alternar estados)
		toggle = { enabled = true },

		-- ============================================
		-- MÓDULOS DESACTIVADOS
		-- ============================================
		-- Desactivados porque usas otros plugins (fzf-lua, telescope, oil, etc.)
		picker = { enabled = false },      -- Selector de archivos (usas fzf-lua/telescope)
		explorer = { enabled = false },    -- Explorador de archivos (usas oil.nvim)
		indent = { enabled = false },      -- Líneas de indentación
		dashboard = { enabled = false },   -- Dashboard (usas alpha-nvim)
		image = { enabled = false },       -- Visualización de imágenes
		scope = { enabled = false },       -- Scope de código
		scroll = { enabled = false },      -- Scroll suave
		statuscolumn = { enabled = false }, -- Columna de estado personalizada
		words = { enabled = false },       -- Gestión de palabras

		-- ============================================
		-- OPCIONES DE CONFIGURACIÓN POR MÓDULO
		-- ============================================
		-- bigfile = {
		--   enabled = true,
		--   filesize = 2,  -- Tamaño en MB para considerar "archivo grande"
		--   pattern = { "*.min.js", "*.min.css" },  -- Patrones adicionales
		-- },
		-- input = {
		--   enabled = true,
		--   prompt = "> ",  -- Prompt personalizado
		--   default_value = "",  -- Valor por defecto
		-- },
		-- notifier = {
		--   enabled = true,
		--   timeout = 5000,  -- Tiempo antes de desaparecer (ms)
		-- },
	},
	-- Mapeos comentados (por si quieres activar el picker de snacks):
	-- keys = {
	--   -- Búsqueda inteligente de archivos
	--   { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
	--   -- Lista de buffers
	--   { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
	--   -- Búsqueda de texto (grep)
	--   { "<leader>'", function() Snacks.picker.grep() end, desc = "Grep" },
	--   -- Historial de comandos
	--   { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
	--   -- Historial de notificaciones
	--   { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
	--   -- Explorador de archivos
	--   { "<leader>e", function() Snacks.picker.explorer() end, desc = "File Explorer" },
	-- },
}
