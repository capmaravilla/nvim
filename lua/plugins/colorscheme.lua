-- ============================================
-- COLORSCHEME: ESQUEMA DE COLORES
-- ============================================
-- Configura el esquema de colores de Neovim
-- Catppuccin es un tema moderno con múltiples variantes (mocha, macchiato, frappe, latte)

return {
	-- Otros temas comentados que puedes probar:
	"Shatur/neovim-ayu",        -- Tema Ayu (claro/oscuro)
	-- "rebelot/kanagawa.nvim",   -- Tema Kanagawa (inspirado en estampas japonesas)
	-- "wuelnerdotexe/vim-enfocado",  -- Tema Enfocado (minimalista)
	-- "catppuccin/nvim",
	lazy = false,      -- Carga inmediatamente (no lazy)
	priority = 1000,   -- Alta prioridad para que se cargue antes que otros plugins

	config = function()
		-- Aplica el esquema de colores
		-- Variantes disponibles: "catppuccin-mocha", "catppuccin-macchiato", "catppuccin-frappe", "catppuccin-latte"
		-- vim.cmd([[colorscheme catppuccin]])
		-- Otros temas que puedes usar:
		vim.cmd([[colorscheme ayu]])
		-- vim.cmd([[colorscheme kanagawa]])
		-- vim.cmd([[colorscheme enfocado]])

		-- ============================================
		-- FONDO TRANSPARENTE
		-- ============================================
		-- Hace que el fondo sea transparente (útil para terminales con transparencia)
		-- Esto permite que se vea el fondo de tu terminal/gestor de ventanas
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })          -- Texto normal
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })     -- Ventanas flotantes
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })        -- Buffers no activos
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })      -- Columna de signos (errores, etc.)
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })         -- Números de línea
		vim.api.nvim_set_hl(0, "Folded", { bg = "none" })         -- Líneas plegadas
		vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })     -- Columna de plegado
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })       -- Divisor vertical
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })      -- Barra de estado activa
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })   -- Barra de estado inactiva
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })    -- Fin del buffer

		-- ============================================
		-- CONFIGURACIÓN ADICIONAL DE CATPPUCCIN
		-- ============================================
		-- Si quieres personalizar más Catppuccin, puedes usar:
		-- require("catppuccin").setup({
		--   flavour = "mocha",  -- mocha, macchiato, frappe, latte
		--   transparent_background = true,  -- Fondo transparente (alternativa al método anterior)
		--   integrations = {
		--     cmp = true,
		--     gitsigns = true,
		--     nvimtree = true,
		--     telescope = true,
		--     treesitter = true,
		--     lsp_trouble = true,
		--   },
		-- })
	end,
}
