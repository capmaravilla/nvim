-- ============================================
-- GITSIGNS.NVIM: INDICADORES DE GIT EN EL CÓDIGO
-- ============================================
-- Muestra información de Git directamente en el editor
-- Indica líneas añadidas, modificadas o eliminadas con colores y números

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		-- No muestra signos en la columna izquierda (signcolumn)
		-- En su lugar, usa resaltado de números de línea
		signcolumn = false,
		-- Resalta los números de línea con colores según el estado Git
		numhl = true,
		-- Solo procesa archivos menores a 10000 líneas (por rendimiento)
		max_file_length = 10000,
		-- Otras opciones disponibles:
		-- signs = {
		--   add = { text = "+" },         -- Signo para líneas añadidas
		--   change = { text = "~" },      -- Signo para líneas modificadas
		--   delete = { text = "_" },      -- Signo para líneas eliminadas
		--   topdelete = { text = "‾" },  -- Signo para primera línea eliminada
		--   changedelete = { text = "~" }, -- Signo para cambio y eliminación
		-- },
		-- on_attach = function(bufnr)
		--   -- Mapeos personalizados cuando Git está activo
		--   local gs = package.loaded.gitsigns
		--   vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
		--   vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
		--   vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
		--   vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame line" })
		-- end,
		-- watch_gitdir = {
		--   interval = 1000,  -- Frecuencia de actualización (ms)
		-- },
		-- current_line_blame = false,  -- Muestra blame en la línea actual
		-- current_line_blame_opts = {
		--   virt_text = true,
		--   virt_text_pos = "eol",  -- Posición del texto virtual
		--   delay = 1000,  -- Retraso antes de mostrar
		-- },
	},
}
