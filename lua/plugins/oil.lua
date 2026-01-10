-- ============================================
-- OIL.NVIM: EXPLORADOR DE ARCHIVOS
-- ============================================
-- Explorador de archivos moderno que se integra con el buffer actual
-- Permite navegar, renombrar, copiar, mover archivos directamente desde Neovim

return {
	"stevearc/oil.nvim",
	lazy = false, -- Carga inmediatamente (recomendado para mejor experiencia)
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- Abre el explorador de archivos
		{
			"<leader>o",
			function()
				require("oil").open()
			end,
			desc = "Open Oil Explorer",
		},
		-- Otros mapeos útiles:
		-- {
		--   "<leader>O",
		--   function()
		--     require("oil").open_float()
		--   end,
		--   desc = "Open Oil in floating window",
		-- },
	},
	config = function()
		require("oil").setup({
			-- No reemplaza el explorador por defecto de Neovim
			default_file_explorer = false,
			-- Otras opciones:
			-- default_file_explorer = true,  -- Reemplaza netrw por defecto

			-- ============================================
			-- OPCIONES DE VISUALIZACIÓN
			-- ============================================
			view_options = {
				-- Muestra archivos ocultos (que empiezan con .)
				show_hidden = true,
				-- Otras opciones:
				-- is_always_hidden = function(name, bufnr)
				--   -- Función para determinar si un archivo debe estar oculto
				--   return false
				-- end,
				-- is_hidden_file = function(name, bufnr)
				--   -- Función para determinar si es un archivo oculto
				--   return vim.startswith(name, ".")
				-- end,
			},

			-- ============================================
			-- MAPEOS DE TECLADO DENTRO DE OIL
			-- ============================================
			keymaps = {

				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-t>"] = false,

				["g?"] = "actions.show_help", -- Muestra ayuda
				["<CR>"] = "actions.select", -- Abre archivo/carpeta
				["<leader><CR>"] = "actions.select_vsplit", -- Abre en split vertical
				["<C><s>"] = "actions.select_split", -- Abre en split horizontal
				-- ["<C-t>"] = "actions.select_tab",     -- Abre en nueva pestaña
				["<C-p>"] = "actions.preview", -- Vista previa
				["<C-c>"] = "actions.close", -- Cierra Oil
				["<C-r>"] = "actions.refresh", -- Actualiza la vista
				["<backspace>"] = "actions.parent", -- Sube al directorio padre
				["_"] = "actions.open_cwd", -- Abre directorio actual
				["`"] = "actions.cd", -- Cambia directorio
				["~"] = "actions.tcd", -- Cambia directorio de trabajo
				["g."] = "actions.toggle_hidden", -- Alterna archivos ocultos
				-- Otros mapeos disponibles:
				-- ["<C-r>"] = "actions.refresh",      -- Refrescar
				-- ["-"] = "actions.parent",           -- Directorio padre (alternativa)
				-- ["<C-v>"] = "actions.select_vsplit", -- Split vertical (alternativa)
				-- ["<C-x>"] = "actions.select_split",  -- Split horizontal (alternativa)
				-- ["<C-o>"] = "actions.select_tab",    -- Nueva pestaña (alternativa)
			},

			-- ============================================
			-- OTRAS OPCIONES
			-- ============================================
			-- columns = { "icon", "permissions", "size", "mtime" },  -- Columnas a mostrar
			-- buf_options = {
			--   buflisted = false,  -- No lista el buffer en :buffers
			--   bufhidden = "hide",  -- Oculta el buffer cuando no está visible
			-- },
			-- win_options = {
			--   wrap = false,  -- No ajusta líneas largas
			--   signcolumn = "no",  -- Sin columna de signos
			--   cursorcolumn = false,  -- Sin columna de cursor
			-- },
			-- skip_confirm_for_simple_edits = false,  -- Pide confirmación para ediciones
			-- prompt_save_on_select_new_entry = true,  -- Guarda cambios al seleccionar nueva entrada
			-- cleanup_delay_ms = 2000,  -- Tiempo antes de limpiar buffers temporales
			-- lsp_file_methods = {
			--   autosave_changes = false,  -- Guarda cambios automáticamente
			--   delete = {
			--     trash = false,  -- No mueve a papelera, elimina permanentemente
			--   },
			-- },
		})
	end,
}
