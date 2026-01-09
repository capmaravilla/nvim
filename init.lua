-- ============================================
-- CONFIGURACIÓN PRINCIPAL DE NEOVIM
-- ============================================
-- Este archivo es el punto de entrada de la configuración.
-- Carga los módulos de configuración en el orden correcto:
-- 1. settings: Configuraciones generales de Neovim (opciones, mapeos básicos)
-- 2. lazy: Gestor de plugins (lazy.nvim)
-- 3. keymaps: Mapeos de teclado personalizados

require("config.settings")
require("config.lazy")
require("config.keymaps")
