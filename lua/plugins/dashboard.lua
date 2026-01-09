-- ============================================
-- ALPHA-NVIM: DASHBOARD DE INICIO
-- ============================================
-- Muestra una pantalla de bienvenida al abrir Neovim
-- Incluye logo, información del sistema y atajos rápidos

return {
	"goolord/alpha-nvim",
	event = "VimEnter",  -- Se carga al entrar a Neovim

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- ============================================
		-- FUNCIONES AUXILIARES
		-- ============================================
		-- Muestra la fecha actual
		local function fecha()
			return os.date(" ┌─   Today is %a %d %b ─┐")
		end

		-- Muestra el número total de plugins instalados
		local function plugins()
			local ok, lazy = pcall(require, "lazy")
			if ok then
				return " └─   " .. #lazy.plugins() .. " plugins in total ─┘"
			end
			return "  plugins"
		end

		-- Muestra la versión de Neovim
		local function nvim_version()
			local v = vim.version()
			return string.format("Neovim %d.%d.%d", v.major, v.minor, v.patch)
		end

		-- ============================================
		-- CABECERA (LOGO Y INFORMACIÓN)
		-- ============================================
		dashboard.section.header.val = {
			"",
			"            ██████",
			"        ████▒▒▒▒▒▒████",
			"      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
			"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
			"  ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒",
			"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓",
			"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓",
			"██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
			"██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██",
			"████  ██▒▒██  ██▒▒▒▒██  ██▒▒██",
			"██      ██      ████      ████",
			"",
			"",
			fecha(),
			plugins(),
		}

		-- ============================================
		-- BOTONES DE ACCESO RÁPIDO
		-- ============================================
		dashboard.section.buttons.val = {
			-- Archivos recientes (usa Telescope)
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
			-- Búsqueda con Ripgrep (usa Telescope)
			dashboard.button("g", "  Ripgrep", ":Telescope live_grep <CR>"),
			-- Gestor de plugins (Lazy)
			dashboard.button("l", "  Lazy", ":Lazy <CR>"),
			-- Abre la configuración de Neovim (usa Oil)
			dashboard.button("c", "  Config", ":lua require('oil').open(vim.fn.stdpath('config')) <CR>"),
			-- Salir de Neovim
			dashboard.button("q", "  Quit", ":qa<CR>"),
			-- Otros botones que puedes añadir:
			-- dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
			-- dashboard.button("n", "  New File", ":ene | startinsert <CR>"),
			-- dashboard.button("s", "  Restore Session", ":lua require('persistence').load() <CR>"),
		}

		-- ============================================
		-- PIE DE PÁGINA
		-- ============================================
		dashboard.section.footer.val = {
			"",
			"",
			nvim_version(),
		}

		-- ============================================
		-- ESTILO Y COLORES
		-- ============================================
		dashboard.section.header.opts.hl = "Type"      -- Color del header
		dashboard.section.buttons.opts.hl = "Keyword"  -- Color de los botones
		dashboard.section.footer.opts.hl = "NonText"   -- Color del footer

		-- Desactiva autocmds para mejor rendimiento
		dashboard.opts.opts.noautocmd = true

		-- Aplica la configuración
		alpha.setup(dashboard.opts)

		-- ============================================
		-- OPCIONES ADICIONALES
		-- ============================================
		-- Puedes personalizar más el dashboard:
		-- dashboard.section.header.opts.position = "center"  -- Posición del header
		-- dashboard.config.layout = {  -- Diseño personalizado
		--   { type = "text", val = dashboard.section.header.val, opts = { position = "center" } },
		--   { type = "buttons", val = dashboard.section.buttons.val, opts = { spacing = 1 } },
		--   { type = "text", val = dashboard.section.footer.val, opts = { position = "center" } },
		-- }
	end,
}
