-- ============================================
-- OPENCODE.NVIM: INTEGRACIÓN CON IA PARA CÓDIGO
-- ============================================
-- Plugin para interactuar con modelos de IA (como ChatGPT, Claude, etc.) desde Neovim
-- Permite explicar, corregir, optimizar código usando IA

return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Snacks proporciona la UI para input y ventanas
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},

	keys = {
		-- ============================================
		-- MAPEOS PRINCIPALES
		-- ============================================
		-- Alterna la ventana de OpenCode
		{
			"<leader>aa",
			function()
				require("opencode").toggle()
			end,
			mode = { "n" },
			desc = "Toggle OpenCode",
		},
		-- Selecciona código y lo envía a OpenCode
		{
			"<leader>as",
			function()
				require("opencode").select({ submit = true })
			end,
			mode = { "n", "x" }, -- Funciona en modo normal y visual
			desc = "OpenCode select",
		},
		-- Pregunta algo a OpenCode (sin contexto)
		{
			"<leader>ai",
			function()
				require("opencode").ask("", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode ask",
		},
		-- Pregunta sobre el código seleccionado
		{
			"<leader>aI",
			function()
				require("opencode").ask("@this: ", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode ask with context",
		},
		-- Pregunta sobre el archivo completo
		{
			"<leader>ab",
			function()
				require("opencode").ask("@file ", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode ask about buffer",
		},
		-- Usa un prompt personalizado con contexto
		{
			"<leader>ap",
			function()
				require("opencode").prompt("@this", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode prompt",
		},
		-- ============================================
		-- PROMPTS PREDEFINIDOS
		-- ============================================
		-- Explica el código seleccionado
		{
			"<leader>ape",
			function()
				require("opencode").prompt("explain", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode explain",
		},
		-- Corrige errores en el código
		{
			"<leader>apf",
			function()
				require("opencode").prompt("fix", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode fix",
		},
		-- Diagnostica problemas en el código
		{
			"<leader>apd",
			function()
				require("opencode").prompt("diagnose", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode diagnose",
		},
		-- Revisa el código
		{
			"<leader>apr",
			function()
				require("opencode").prompt("review", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode review",
		},
		-- Genera tests para el código
		{
			"<leader>apt",
			function()
				require("opencode").prompt("test", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode test",
		},
		-- Optimiza el código
		{
			"<leader>apo",
			function()
				require("opencode").prompt("optimize", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "OpenCode optimize",
		},
	},
	config = function()
		-- ============================================
		-- CONFIGURACIÓN DE OPENCODE
		-- ============================================
		vim.g.opencode_opts = {
			provider = {
				snacks = {
					win = {
						position = "left", -- Posición de la ventana (izquierda)
						-- Otras opciones:
						-- position = "right",  -- Derecha
						-- position = "top",    -- Arriba
						-- position = "bottom",  -- Abajo
					},
				},
			},
			-- Otras opciones disponibles:
			-- api_key = "your-api-key",  -- Clave API para el proveedor de IA
			-- model = "gpt-4",  -- Modelo a usar
			-- temperature = 0.7,  -- Temperatura del modelo (0-1)
			-- max_tokens = 2000,  -- Máximo de tokens en la respuesta
		}
		-- Lee automáticamente cambios en archivos (útil para ver respuestas de IA)
		vim.o.autoread = true
	end,
}
