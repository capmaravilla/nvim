-- ============================================
-- CONFIGURACIÓN DE LAZY.NVIM
-- ============================================
-- Lazy.nvim es el gestor de plugins para Neovim
-- Este archivo instala lazy.nvim si no está presente y lo configura

-- ============================================
-- INSTALACIÓN AUTOMÁTICA DE LAZY.NVIM
-- ============================================
-- Ruta donde se instalará lazy.nvim (en el directorio de datos de Neovim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Si lazy.nvim no está instalado, lo clona automáticamente
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- Si falla la instalación, muestra un error y sale
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Añade lazy.nvim al runtimepath (necesario para que Neovim lo encuentre)
vim.opt.rtp:prepend(lazypath)

-- ============================================
-- CONFIGURACIÓN DE LAZY.NVIM
-- ============================================
require("lazy").setup({
  spec = {
    -- Importa todos los plugins desde la carpeta lua/plugins/
    -- Lazy.nvim cargará automáticamente todos los archivos .lua en esa carpeta
    { import = "plugins" },
  },
  -- Verificador automático de actualizaciones de plugins
  checker = { enabled = true },
  -- Otras opciones disponibles:
  -- checker = {
  --   enabled = true,
  --   notify = true,              -- Notifica cuando hay actualizaciones
  --   frequency = 3600,           -- Verifica cada hora (en segundos)
  --   check_pinned = false,       -- No verifica plugins con versión fija
  -- },
  -- performance = {
  --   rtp = {
  --     disabled_plugins = {      -- Desactiva plugins de Neovim que no necesitas
  --       "gzip",
  --       "matchit",
  --       "matchparen",
  --       "netrwPlugin",
  --       "tarPlugin",
  --       "tohtml",
  --       "tutor",
  --       "zipPlugin",
  --     },
  --   },
  -- },
  -- ui = {
  --   border = "rounded",         -- Borde redondeado para las ventanas de lazy
  --   icons = {
  --     cmd = "⌘",
  --     config = "🛠",
  --     event = "📅",
  --     ft = "📂",
  --     init = "⚙",
  --     keys = "🗝",
  --     plugin = "🔌",
  --     runtime = "💻",
  --     source = "📄",
  --     start = "🚀",
  --     task = "📌",
  --     lazy = "💤 ",
  --   },
  -- },
})
