-- ============================================
-- MAPEOS DE TECLADO PERSONALIZADOS
-- ============================================
-- Este archivo contiene mapeos adicionales que no están en settings.lua
-- Los mapeos principales están en settings.lua

-- ============================================
-- NAVEGACIÓN DE BUFFERS (ALTERNATIVA)
-- ============================================
-- Navegar al siguiente buffer con "gb"
-- Alternativa a <Tab> (útil si prefieres este mapeo)
vim.keymap.set("n", "gb", ":bn<CR>", { noremap = true, silent = true, desc = "Next buffer" })
-- Navegar al buffer anterior con "gB"
vim.keymap.set("n", "gB", ":bp<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
-- NOTA: Estos mapeos son redundantes con <Tab> y <S-Tab> en settings.lua
-- Puedes eliminar estos si prefieres usar solo Tab/Shift+Tab
