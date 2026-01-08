return {
	"goolord/alpha-nvim",
	event = "VimEnter",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- FECHA
		local function fecha()
			return os.date(" ┌─   Today is %a %d %b ─┐")
		end

		-- PLUGINS
		local function plugins()
			local ok, lazy = pcall(require, "lazy")
			if ok then
				return " └─   " .. #lazy.plugins() .. " plugins in total ─┘"
			end
			return "  plugins"
		end

		-- VERSIÓN NVIM
		local function nvim_version()
			local v = vim.version()
			return string.format("Neovim %d.%d.%d", v.major, v.minor, v.patch)
		end

		-- LOGO
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
		-- ATAJOS
		dashboard.section.buttons.val = {

			dashboard.button("e", "󰈔  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱼  Buscar archivo", ":Telescope find_files <CR>"),
			dashboard.button("r", "󰄉  Recientes", ":Telescope oldfiles <CR>"),
			dashboard.button("g", "󰊄  Ripgrep", ":Telescope live_grep <CR>"),
			dashboard.button("p", "󰏖  Plugins", ":Lazy <CR>"),
			dashboard.button("q", "󰩈  Salir", ":qa<CR>"),
		}

		-- FOOTER (sustituye la firma)
		dashboard.section.footer.val = {
			"",
			"",
			nvim_version(),
		}

		-- ESTILO
		dashboard.section.header.opts.hl = "Type"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "NonText"

		dashboard.opts.opts.noautocmd = true

		alpha.setup(dashboard.opts)
	end,
}

--
