-- ============================================
-- TELESCOPE: BÚSQUEDA Y NAVEGACIÓN
-- ============================================
-- Herramienta de búsqueda potente para archivos, texto, buffers, etc.
-- NOTA: También tienes fzf-lua configurado. Puedes usar el que prefieras.

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",  -- Librería de utilidades requerida
		-- Extensiones opcionales que puedes añadir:
		-- "nvim-telescope/telescope-fzf-native.nvim",  -- Mejora rendimiento con fzf
		-- "nvim-telescope/telescope-file-browser.nvim",  -- Explorador de archivos
		-- "nvim-telescope/telescope-ui-select.nvim",  -- Selector UI mejorado
	},
	cmd = "Telescope",  -- Carga cuando usas el comando Telescope
	keys = {
		-- Buscar archivos en el proyecto
		{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
		-- Búsqueda de texto en tiempo real (live grep)
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Grep" },
		-- Lista de buffers abiertos
		{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
		-- Buscar en la ayuda de Neovim
		{ "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help" },
		-- Otros mapeos útiles que puedes añadir:
		-- { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		-- { "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Grep string under cursor" },
		-- { "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		-- { "<leader>tc", "<cmd>Telescope commands<cr>", desc = "Commands" },
		-- { "<leader>td", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				-- ============================================
				-- CONFIGURACIÓN DE LAYOUT
				-- ============================================
				layout_config = {
					-- Layout horizontal (por defecto)
					horizontal = {
						width = 0.8,         -- Ancho de la ventana (80%)
						preview_width = 0.5, -- Ancho de la vista previa (50%)
					},
					-- Layout vertical
					vertical = {
						height = 0.8,         -- Altura de la ventana (80%)
						preview_height = 0.5,  -- Altura de la vista previa (50%)
					},
					-- Otros layouts disponibles:
					-- center = { height = 0.4, width = 0.5 },
					-- cursor = { height = 0.9, width = 0.8 },
					-- bottom_pane = { height = 25 },
				},
				-- Ordena resultados de forma ascendente (primer resultado arriba)
				sorting_strategy = "ascending",
				-- Prefijo del prompt (el emoji de lupa)
				prompt_prefix = "🔍 ",
				-- Otras opciones disponibles:
				-- selection_strategy = "reset",  -- Estrategia de selección
				-- border = true,  -- Muestra borde
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },  -- Caracteres del borde
				-- color_devicons = true,  -- Colorea los iconos
				-- file_ignore_patterns = {  -- Ignora estos patrones al buscar
				--   "%.git/",
				--   "node_modules/",
				--   "%.o",
				-- },
				-- vimgrep_arguments = {  -- Argumentos para grep
				--   "rg",
				--   "--color=never",
				--   "--no-heading",
				--   "--with-filename",
				--   "--line-number",
				--   "--column",
				--   "--smart-case",
				-- },
			},
			-- Extensiones (si las instalas):
			-- extensions = {
			--   fzf = {
			--     fuzzy = true,
			--     override_generic_sorter = true,
			--     override_file_sorter = true,
			--     case_mode = "smart_case",
			--   },
			-- },
		})
		-- Carga extensiones (si las tienes):
		-- telescope.load_extension("fzf")
		-- telescope.load_extension("file_browser")
	end,
}
