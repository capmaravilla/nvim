-- ============================================
-- CONFIGURACIÓN GENERAL DE NEOVIM
-- ============================================
-- Este archivo contiene todas las opciones y configuraciones básicas de Neovim

-- ============================================
-- LÍDERES (LEADER KEYS)
-- ============================================
-- Define la tecla líder para mapeos personalizados
-- La tecla líder es "Espacio" (más cómodo que la barra invertida por defecto)
vim.g.mapleader = " "
-- Líder local para mapeos específicos de buffer
vim.g.maplocalleader = "\\"

-- ============================================
-- INTERFAZ Y VISUALIZACIÓN
-- ============================================
-- Muestra números de línea absolutos
vim.opt.number = true
-- Muestra números de línea relativos (útil para movimientos)
vim.opt.relativenumber = true
-- Resalta la línea donde está el cursor
vim.opt.cursorline = true
-- Elimina el carácter "~" al final del buffer (más limpio)
vim.opt.fillchars = { eob = " " }
-- Otras opciones visuales que puedes activar:
-- vim.opt.wrap = true              -- Ajusta líneas largas
-- vim.opt.showmatch = true         -- Resalta paréntesis/llaves coincidentes
-- vim.opt.colorcolumn = "80"       -- Línea vertical en columna 80
-- vim.opt.signcolumn = "yes"      -- Columna para signos (errores, etc.)

-- ============================================
-- PORTAPAPELES (CLIPBOARD)
-- ============================================
-- Integra el portapapeles de Neovim con el del sistema
-- Permite copiar/pegar entre Neovim y otras aplicaciones
vim.opt.clipboard = "unnamedplus"
-- Alternativas:
-- "unnamed" - Solo integra con el portapapeles primario (Linux)
-- "unnamedplus" - Integra con ambos portapapeles (recomendado)

-- ============================================
-- TABS Y ESPACIOS
-- ============================================
-- Número de espacios que representa un tab
vim.opt.tabstop = 2
-- Número de espacios al insertar un tab
vim.opt.softtabstop = 2
-- Convierte tabs en espacios (recomendado para consistencia)
vim.opt.expandtab = true
-- Número de espacios para indentación automática
vim.opt.shiftwidth = 2
-- Otras opciones relacionadas:
-- vim.opt.smartindent = true       -- Indentación inteligente
-- vim.opt.autoindent = true        -- Mantiene indentación de línea anterior

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
-- DIAGNÓSTICOS LSP
-- ============================================
-- Configura cómo se muestran los errores y advertencias del LSP
vim.diagnostic.config({
  virtual_text = true,  -- Muestra errores en línea como texto virtual
  -- Otras opciones disponibles:
  -- signs = true,                    -- Muestra signos en la columna izquierda
  -- underline = true,                -- Subraya el código con errores
  -- update_in_insert = false,        -- No actualiza mientras escribes
  -- severity_sort = true,            -- Ordena por severidad
  -- float = { border = "rounded" },  -- Estilo del popup flotante
})

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

