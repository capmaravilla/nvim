-- ============================================
-- MAPEOS DE TECLADO PERSONALIZADOS
-- ============================================
-- Este archivo contiene mapeos adicionales que no están en settings.lua
-- Los mapeos principales están en settings.lua

-- ============================================
-- MAPEOS DE TECLADO - NAVEGACIÓN DE BUFFERS
-- ============================================
-- Navegar al siguiente buffer con Tab (solo en modo normal)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { desc = "Next buffer" })
-- Navegar al buffer anterior con Shift+Tab (solo en modo normal)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { desc = "Previous buffer" })
-- NOTA: Estos mapeos solo funcionan en modo normal (n)
-- En modo insert, <Tab> se usa para autocompletado (ver nvim-cmp.lua)

-- Mapeo comentado (por si lo necesitas más adelante):
-- vim.keymap.set("n", "<leader>o", "o<Esc>k", { desc = "Insert new line above" })

-- ============================================
-- MAPEO PARA FORMATEO DE CÓDIGO
-- ============================================
-- Formatea el buffer actual usando Conform
-- <leader>f formatea todo el archivo
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format buffer (Conform)" })
-- Otras opciones de formateo:
-- vim.keymap.set("v", "<leader>f", function()
--   require("conform").format({ async = true, range = true })
-- end, { desc = "Format selection" })
