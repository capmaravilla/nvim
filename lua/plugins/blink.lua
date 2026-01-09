-- ============================================
-- BLINK.CMP: SISTEMA DE AUTOCOMPLETADO AVANZADO
-- ============================================
-- Plugin de autocompletado rápido y moderno con soporte para LSP, snippets, etc.
-- NOTA: Este plugin puede reemplazar o complementar nvim-cmp
-- Si usas blink.cmp, considera desactivar nvim-cmp para evitar conflictos

return {
	"saghen/blink.cmp",
	-- Proporciona snippets predefinidos para varios lenguajes
	dependencies = { "rafamadriz/friendly-snippets" },

	-- Usa una versión específica (tag de release) para descargar binarios precompilados
	version = "1.*",
	-- Otras opciones de build:
	-- build = 'cargo build --release',  -- Compilar desde fuente (requiere Rust nightly)
	-- build = 'nix run .#build-plugin',  -- Si usas Nix

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- ============================================
		-- PRESET DE MAPEOS DE TECLADO
		-- ============================================
		-- 'default': Mapeos similares a completado nativo (C-y para aceptar)
		-- 'super-tab': Mapeos estilo VSCode (Tab para aceptar)
		-- 'enter': Enter para aceptar (configuración actual)
		-- 'none': Sin mapeos automáticos
		--
		-- Todos los presets incluyen estos mapeos:
		-- C-Space: Abre menú o documentación si ya está abierto
		-- C-n/C-p o Up/Down: Selecciona siguiente/anterior item
		-- C-e: Oculta el menú
		-- C-k: Alterna ayuda de firma (si signature.enabled = true)
		keymap = { preset = "enter" },
		-- Mapeos personalizados (ver :h blink-cmp-config-keymap):
		-- keymap = {
		--   custom = {
		--     ["<Tab>"] = "select_next",
		--     ["<S-Tab>"] = "select_prev",
		--   },
		-- },

		-- ============================================
		-- APARIENCIA
		-- ============================================
		appearance = {
			-- 'mono' (por defecto): Usa 'Nerd Font Mono' para alineación perfecta de iconos
			-- 'normal': Usa 'Nerd Font' normal
			nerd_font_variant = "mono",
			-- Otras opciones de apariencia:
			-- border = "rounded",  -- Estilo del borde del menú
			-- max_width = 50,     -- Ancho máximo del menú
			-- max_height = 10,     -- Altura máxima del menú
		},

		-- ============================================
		-- COMPORTAMIENTO DE COMPLETADO
		-- ============================================
		completion = {
			-- Muestra la documentación automáticamente al seleccionar un item
			documentation = { auto_show = true },
			-- Otras opciones:
			-- documentation = {
			--   auto_show = false,  -- Solo muestra al presionar C-Space
			--   position = "right",  -- Posición de la documentación
			--   max_width = 60,     -- Ancho máximo
			-- },
			-- trigger_on_delete = true,  -- Activa completado al borrar
		},

		-- ============================================
		-- FUENTES DE AUTOCOMPLETADO
		-- ============================================
		-- Lista de fuentes habilitadas por defecto
		-- Puedes extender esta lista en otros archivos usando `opts_extend`
		sources = {
			default = {
				"lsp",      -- Completado desde Language Server Protocol
				"path",     -- Completado de rutas de archivos
				"snippets", -- Snippets de código
				"buffer",   -- Palabras del buffer actual
			},
			-- Otras fuentes disponibles:
			-- "nvim_lua",  -- API de Neovim
			-- "calc",      -- Calculadora
			-- "emoji",     -- Emojis
			-- "tags",      -- Tags de ctags
		},

		-- ============================================
		-- BÚSQUEDA DIFUSA (FUZZY MATCHING)
		-- ============================================
		-- Motor de búsqueda difusa para mejor rendimiento y tolerancia a errores
		fuzzy = {
			-- 'prefer_rust_with_warning': Usa Rust si está disponible, sino Lua (con advertencia)
			-- 'prefer_rust': Usa Rust si está disponible, sino Lua (sin advertencia)
			-- 'rust': Solo usa Rust (falla si no está disponible)
			-- 'lua': Solo usa implementación Lua
			implementation = "prefer_rust_with_warning",
			-- Otras opciones:
			-- min_char_length = 1,  -- Longitud mínima para activar búsqueda difusa
			-- threshold = 0.5,      -- Umbral de similitud (0-1)
		},

		-- ============================================
		-- OTRAS OPCIONES
		-- ============================================
		-- signature = {
		--   enabled = true,  -- Muestra ayuda de firma de funciones
		--   trigger_on_typing = true,  -- Se activa al escribir
		-- },
		-- snippet = {
		--   expand = function(args)
		--     require("luasnip").lsp_expand(args.body)
		--   end,
		-- },
	},
	-- Permite extender las fuentes por defecto sin redefinirlas
	opts_extend = { "sources.default" },
}
