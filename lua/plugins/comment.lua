-- ============================================
-- COMMENT.NVIM: COMENTAR/DESCOMENTAR CÓDIGO
-- ============================================
-- Plugin para comentar y descomentar líneas/bloques de código fácilmente
-- Usa 'gcc' para comentar una línea, 'gbc' para comentar un bloque, etc.

return {
	"numToStr/Comment.nvim",
	opts = {
		-- Otras opciones disponibles:
		-- padding = true,  -- Añade espacio después del comentario
		-- sticky = true,   -- Mantiene el cursor en la misma posición
		-- ignore = "^%s*",  -- Ignora líneas que empiezan con espacios
		-- toggler = {
		--   line = "gcc",  -- Comentar/descomentar línea (por defecto)
		--   block = "gbc",  -- Comentar/descomentar bloque (por defecto)
		-- },
		-- opleader = {
		--   line = "gc",   -- Operador para comentar líneas (gc + movimiento)
		--   block = "gb",  -- Operador para comentar bloques (gb + movimiento)
		-- },
		-- extra = {
		--   above = "gcO",  -- Comentar línea arriba
		--   below = "gco",  -- Comentar línea abajo
		--   eol = "gcA",    -- Comentar al final de la línea
		-- },
		-- mappings = {
		--   basic = true,   -- Mapeos básicos (gcc, gbc, etc.)
		--   extra = true,   -- Mapeos extra (gcO, gco, gcA)
		-- },
		-- pre_hook = function(ctx)
		--   -- Hook antes de comentar (útil para integración con otros plugins)
		--   return nil
		-- end,
	},
}


