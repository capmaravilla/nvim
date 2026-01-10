-- La tecla líder es "Espacio" (más cómodo que la barra invertida por defecto)
vim.g.mapleader = " "

-- Líder local para mapeos específicos de buffer
vim.g.maplocalleader = "\\"

-- Navegar al siguiente buffer con Tab (solo en modo normal)
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { desc = "Next buffer" })

-- Navegar al buffer anterior con Shift+Tab (solo en modo normal)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { desc = "Previous buffer" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

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
