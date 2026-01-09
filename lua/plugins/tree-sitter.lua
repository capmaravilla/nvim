-- ============================================
-- TREESITTER: RESALTADO DE SINTAXIS AVANZADO
-- ============================================
-- Proporciona resaltado de sintaxis preciso y otras funcionalidades basadas en parsing
-- Usa árboles de sintaxis para entender mejor el código

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,  -- Carga inmediatamente (necesario para resaltado)
	build = ":TSUpdate",  -- Comando para actualizar parsers
	config = function()
		require("nvim-treesitter.configs").setup({
			-- ============================================
			-- PARSERS INSTALADOS
			-- ============================================
			-- Lista de parsers que se instalarán automáticamente
			ensure_installed = {
				"lua",            -- Lua
				"luadoc",         -- Documentación Lua
				"javascript",     -- JavaScript
				"python",         -- Python
				"html",           -- HTML
				"css",            -- CSS
				"typescript",     -- TypeScript
				"markdown",       -- Markdown
				"markdown_inline", -- Markdown inline
				-- Otros parsers que puedes añadir:
				-- "json",         -- JSON
				-- "yaml",         -- YAML
				-- "toml",         -- TOML
				-- "rust",         -- Rust
				-- "go",           -- Go
				-- "c",            -- C
				-- "cpp",          -- C++
				-- "bash",         -- Bash
				-- "dockerfile",   -- Dockerfile
			},
			-- No instala parsers de forma síncrona (más rápido)
			sync_install = false,
			-- Instala parsers automáticamente si faltan
			auto_install = true,

			-- ============================================
			-- RESALTADO DE SINTAXIS
			-- ============================================
			highlight = {
				-- Habilita el resaltado de sintaxis
				enable = true,
				-- No usa resaltado adicional de Vim (solo Treesitter)
				additional_vim_regex_highlighting = false,
				-- Otras opciones:
				-- disable = { "lua" },  -- Desactiva para lenguajes específicos
				-- use_languagetree = true,  -- Usa language tree (más preciso)
			},

			-- ============================================
			-- OTRAS FUNCIONALIDADES DISPONIBLES
			-- ============================================
			-- Incremento de selección (similar a expand_region)
			-- incremental_selection = {
			--   enable = true,
			--   keymaps = {
			--     init_selection = "gnn",
			--     node_incremental = "grn",
			--     scope_incremental = "grc",
			--     node_decremental = "grm",
			--   },
			-- },
			-- Indentación automática basada en el árbol de sintaxis
			-- indent = {
			--   enable = true,
			-- },
			-- Resaltado de paréntesis/llaves coincidentes
			-- matchup = {
			--   enable = true,
			-- },
			-- Navegación de contexto (muestra contexto del código)
			-- context_commentstring = {
			--   enable = true,
			-- },
			-- Autocerrar tags HTML/XML
			-- autotag = {
			--   enable = true,
			-- },
			-- Plegado de código basado en sintaxis
			-- fold = {
			--   enable = true,
			--   disable = { "markdown" },  -- Desactiva para ciertos lenguajes
			-- },
		})
	end,
}
