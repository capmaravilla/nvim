-- ============================================
-- NOICE.NVIM: INTERFAZ MEJORADA PARA MENSAJES
-- ============================================
-- Mejora la visualización de mensajes, comandos y notificaciones
-- Reemplaza los mensajes por defecto con una interfaz más moderna

return {
	"folke/noice.nvim",
	event = "VeryLazy",  -- Carga tarde para mejor rendimiento
	dependencies = {
		"MunifTanjim/nui.nvim",      -- Framework UI para Neovim
		"rcarriga/nvim-notify",      -- Sistema de notificaciones
	},
	opts = {
		-- ============================================
		-- INTEGRACIÓN CON LSP
		-- ============================================
		-- Reemplaza las notificaciones del LSP con Noice
		lsp = {
			override = {
				["vim.notify"] = true,  -- Reemplaza vim.notify
				-- ["vim.lsp.util.show_line_diagnostics"] = true,  -- Reemplaza diagnósticos en línea
			},
			-- Otras opciones LSP:
			-- progress = {
			--   enabled = true,  -- Muestra progreso de operaciones LSP
			--   format = "lsp_progress",  -- Formato del mensaje
			-- },
			-- hover = {
			--   enabled = true,  -- Mejora la visualización de hover
			--   silent = false,  -- No silencia los mensajes
			-- },
			-- signature = {
			--   enabled = true,  -- Mejora la ayuda de firma
			-- },
		},
		-- ============================================
		-- LÍNEA DE COMANDOS
		-- ============================================
		cmdline = {
			-- Muestra la línea de comandos en un popup flotante
			view = "cmdline_popup",
			-- Otras opciones:
			-- format = {
			--   -- Personaliza el formato de los comandos
			--   cmdline = { pattern = "^:", icon = "  ", lang = "vim" },
			--   search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
			--   search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
			-- },
		},
		-- ============================================
		-- VISTAS Y POSICIONAMIENTO
		-- ============================================
		views = {
			cmdline_popup = {
				position = {
					row = "10%",  -- 20% desde arriba
					col = "50%",  -- Centrado horizontalmente
				},
				size = {
					width = 60,      -- Ancho fijo
					height = "auto", -- Altura automática
				},
			},
			-- Otras vistas que puedes configurar:
			-- notify = {
			--   position = { row = 2, col = "100%" },  -- Notificaciones en la esquina superior derecha
			--   timeout = 3000,  -- Tiempo antes de desaparecer (ms)
			-- },
			-- popupmenu = {
			--   position = { row = 8, col = "50%" },  -- Menú de autocompletado
			-- },
		},
		-- ============================================
		-- OTRAS OPCIONES
		-- ============================================
		-- messages = {
		--   enabled = true,  -- Mejora los mensajes de Neovim
		--   view = "notify",  -- Vista para mensajes
		--   view_error = "notify",  -- Vista para errores
		--   view_warn = "notify",  -- Vista para advertencias
		--   view_history = "messages",  -- Historial de mensajes
		-- },
		-- presets = {
		--   bottom_search = true,  -- Búsqueda en la parte inferior
		--   command_palette = true,  -- Paleta de comandos
		--   long_message_to_split = true,  -- Divide mensajes largos
		--   inc_rename = false,  -- Renombrado incremental
		--   lsp_doc_border = true,  -- Borde en documentación LSP
		-- },
		-- routes = {
		--   -- Define rutas para diferentes tipos de mensajes
		--   { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
		-- },
	},
}
