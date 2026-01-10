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

local wk = require("which-key")
wk.add({
	-- { "<leader>f", group = "file" }, -- group
	-- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	-- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
	-- { "<leader>fn", desc = "New File" },
	{ "<leader>w", hidden = true }, -- hide this keymap
	{ "<leader>q", hidden = true }, -- hide this keymap
	{ "<leader>W", hidden = true }, -- hide this keymap
	{ "<leader>Q", hidden = true }, -- hide this keymap
	-- {
	--   -- Nested mappings are allowed and can be added in any order
	--   -- Most attributes can be inherited or overridden on any level
	--   -- There's no limit to the depth of nesting
	--   mode = { "n", "v" }, -- NORMAL and VISUAL mode
	--   { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
	--   { "<leader>w", "<cmd>w<cr>", desc = "Write" },
	-- }
})
