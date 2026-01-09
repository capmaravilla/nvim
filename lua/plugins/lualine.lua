-- ============================================
-- LUALINE: BARRA DE ESTADO PERSONALIZADA
-- ============================================
-- Muestra información útil en la barra de estado (modo, archivo, Git, LSP, etc.)
-- Reemplaza la barra de estado por defecto de Neovim

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			-- Muestra iconos en la barra de estado (requiere nerd fonts)
			icons_enabled = true,
			-- Tema automático (se adapta al colorscheme)
			theme = "auto",
			-- Usa una sola barra de estado para todas las ventanas
			globalstatus = true,
			-- Otras opciones disponibles:
			-- component_separators = { left = "│", right = "│" },  -- Separadores de componentes
			-- section_separators = { left = "", right = "" },     -- Separadores de secciones
			-- disabled_filetypes = { "alpha" },  -- Desactiva en ciertos tipos de archivo
			-- always_divide_middle = true,  -- Divide siempre la sección media
		},
		-- Secciones de la barra de estado (puedes personalizarlas):
		-- sections = {
		--   lualine_a = { "mode" },  -- Modo actual (normal, insert, visual, etc.)
		--   lualine_b = { "branch", "diff", "diagnostics" },  -- Git y diagnósticos
		--   lualine_c = { "filename" },  -- Nombre del archivo
		--   lualine_x = { "encoding", "fileformat", "filetype" },  -- Info del archivo
		--   lualine_y = { "progress" },  -- Progreso en el archivo
		--   lualine_z = { "location" },  -- Ubicación del cursor
		-- },
		-- inactive_sections = {
		--   -- Secciones para buffers inactivos
		--   lualine_a = {},
		--   lualine_b = {},
		--   lualine_c = { "filename" },
		--   lualine_x = { "location" },
		--   lualine_y = {},
		--   lualine_z = {},
		-- },
		-- tabline = {
		--   -- Barra de pestañas (si quieres mostrar buffers/tabs)
		--   lualine_a = { "buffers" },
		--   lualine_b = {},
		--   lualine_c = {},
		--   lualine_x = {},
		--   lualine_y = {},
		--   lualine_z = { "tabs" },
		-- },
		-- extensions = { "nvim-tree", "fugitive" },  -- Extensiones para otros plugins
	},
}
