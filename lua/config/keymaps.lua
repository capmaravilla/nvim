-- ============================================
-- MAPEOS DE TECLADO PERSONALIZADOS
-- ============================================
-- Este archivo contiene mapeos adicionales que no están en settings.lua
-- Los mapeos principales están en settings.lua

-- ============================================
-- LÍDERES (LEADER KEYS)
-- ============================================
-- Define la tecla líder para mapeos personalizados
-- La tecla líder es "Espacio" (más cómodo que la barra invertida por defecto)
vim.g.mapleader = " "
-- Líder local para mapeos específicos de buffer
vim.g.maplocalleader = "\\"

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

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- ============================================
-- MAPEO PARA FORMATEO DE CÓDIGO
-- ============================================
-- Formatea el buffer actual usando Conform
-- <leader>f formatea todo el archivo
-- vim.keymap.set("n", "<leader>cf", function()
-- 	require("conform").format({ async = true })
-- end, { desc = "Format buffer (Conform)" })

-- Guarda y formatea
vim.keymap.set("n", "<leader>w", function()
	require("conform").format({ async = false })
	vim.cmd("write")
end, { desc = "Save + format (Conform)", silent = true })

-- -- Guardar archivo
-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file", silent = true})

-- Guardar todos los buffers
vim.keymap.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "Save all", silent = true })

-- Salir (solo si no hay cambios)
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit", silent = true })

-- Salir forzado (descarta cambios)
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Quit without saving", silent = true })

-- Guardar y salir
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit", silent = true })
