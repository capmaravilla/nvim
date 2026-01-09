-- Plugin: obsidian.nvim
-- Integración de Obsidian con Neovim para gestionar tu bóveda de notas
return {
	"epwalsh/obsidian.nvim",
	version = "*", -- Usa la última versión estable
	lazy = true, -- Solo carga cuando abres archivos markdown
	ft = "markdown", -- Se activa con archivos .md

	-- Dependencias necesarias
	dependencies = {
		"nvim-lua/plenary.nvim", -- Librería de utilidades para Neovim
	},

	opts = {
		-- ============================================
		-- CONFIGURACIÓN DE TU BÓVEDA
		-- ============================================
		workspaces = {
			{
				name = "Sanctuary IV", -- Nombre de tu bóveda
				path = "D:/Mis Documentos/GoogleDrive/PKM/Sanctuary IV", -- Ruta completa
				new_notes_location = "Inbox",
			},
			-- Puedes añadir más bóvedas si las tienes:
			-- {
			--   name = "trabajo",
			--   path = "~/documentos/notas-trabajo",
			-- },
		},

		-- ============================================
		-- NOTAS DIARIAS (Daily Notes)
		-- ============================================
		daily_notes = {
			folder = "daily", -- Carpeta donde se guardan las notas diarias
			date_format = "%Y-%m-%d", -- Formato: 2026-01-09
			-- alias_format = "%B %-d, %Y",  -- Alias legible: January 9, 2026
			-- default_tags = { "daily-notes" },  -- Tags automáticos
			-- template = nil,  -- Sin plantilla para notas diarias
		},

		-- ============================================
		-- AUTOCOMPLETADO
		-- ============================================
		completion = {
			nvim_cmp = true, -- Integración con nvim-cmp si lo usas
			min_chars = 2, -- Empieza a sugerir después de 2 caracteres

			-- Autocompletar con [[enlaces]] mientras escribes
			-- prepend_note_id = true,  -- Añade ID antes del título en sugerencias
			-- prepend_note_path = false,  -- No añade la ruta completa
			-- use_path_only = false,  -- Usa título, no solo la ruta
		},

		-- ============================================
		-- PLANTILLAS (DESACTIVADAS según pediste)
		-- ============================================
		templates = {
			folder = "D:/Mis Documentos/GoogleDrive/PKM/Sanctuary IV/Recursos/Plantillas", -- Carpeta de plantillas
			date_format = "%Y-%m-%d", -- Formato de fecha en plantillas
			time_format = "%H:%M", -- Formato de hora
			-- substitutions = {},  -- Variables personalizadas para plantillas
		},

		-- IMPORTANTE: Sin plantilla por defecto para notas nuevas
		-- note_id_func = nil, -- Sin función de ID automático
    note_id_func = function(title)
      if title == nil or title == "" then
        return ""  -- Sin timestamp automático
      else
        return title
      end
    end,
		note_frontmatter_func = function(note)
			-- Devuelve frontmatter vacío para notas nuevas
			return {}

			-- Si quisieras frontmatter mínimo, descomenta esto:
			-- return {
			--   date = os.date("%Y-%m-%d"),
			-- }
		end,

		-- ============================================
		-- FORMATO DE ENLACES (Wikilinks)
		-- ============================================
		-- Cómo se crean los enlaces [[nota]]
		wiki_link_func = function(opts)
			return string.format("[[%s]]", opts.label)
		end,

		-- Cómo se crean los enlaces markdown [texto](url)
		-- markdown_link_func = function(opts)
		--   return string.format("[%s](%s)", opts.label, opts.path)
		-- },

		-- ============================================
		-- DETECTAR NOTAS AL ABRIR ARCHIVOS
		-- ============================================
		-- Reconoce automáticamente archivos .md en tu bóveda
		-- detect_cwd = false,  -- No cambia directorio automáticamente

		-- ============================================
		-- BÚSQUEDA Y NAVEGACIÓN
		-- ============================================
		finder = "telescope.nvim", -- Usa Telescope para buscar (necesitas tenerlo instalado)
		-- finder = "fzf-lua",  -- Alternativa: fzf-lua
		-- finder = "fzf.vim",  -- Alternativa: fzf.vim

		-- sort_by = "modified",  -- Ordena resultados por fecha modificación
		-- sort_reversed = true,  -- Más recientes primero
		-- search_max_lines = 1000,  -- Líneas máximas a buscar por archivo
		-- open_notes_in = "current",  -- Abre notas en buffer actual
		-- open_notes_in = "vsplit",   -- Abre en split vertical
		-- open_notes_in = "hsplit",   -- Abre en split horizontal

		-- ============================================
		-- COMPORTAMIENTO DE IDs DE NOTAS
		-- ============================================
		disable_frontmatter = true, -- Permite YAML frontmatter
		-- note_path_func = nil,  -- Función personalizada para rutas de notas

		-- ============================================
		-- BACKLINKS (Enlaces entrantes)
		-- ============================================
		-- backlinks = {
		--   height = 10,  -- Altura de la ventana de backlinks
		--   wrap = true,  -- Ajusta líneas largas
		-- },

		-- ============================================
		-- SEGUIR ENLACES CON "gf"
		-- ============================================
		follow_url_func = function(url)
			-- Abre URLs en tu navegador por defecto
			vim.fn.jobstart({ "xdg-open", url }) -- Linux
			-- vim.fn.jobstart({"open", url})  -- macOS
			-- vim.fn.jobstart({"start", url})  -- Windows
		end,

		-- ============================================
		-- ADJUNTOS (Imágenes, PDFs, etc.)
		-- ============================================
		attachments = {
			img_folder = "attachments", -- Carpeta para imágenes
			-- img_name_func = function()
			--   return string.format("%s-", os.time())  -- Nombre con timestamp
			-- end,
			-- img_text_func = function(client, path)
			--   return string.format("![%s](%s)", path.name, path.path)
			-- end,
		},

		-- ============================================
		-- INTEGRACIÓN CON PICKER (Selector de archivos)
		-- ============================================
		picker = {
			name = "telescope.nvim", -- Usa Telescope
			-- note_mappings = {
			--   new = "<C-x>",  -- Crear nueva nota desde el picker
			--   insert_link = "<C-l>",  -- Insertar enlace a nota
			-- },
			-- tag_mappings = {
			--   tag_note = "<C-x>",  -- Añadir tag
			--   insert_tag = "<C-l>",  -- Insertar tag
			-- },
		},

		-- ============================================
		-- UI Y RENDERIZADO
		-- ============================================
		ui = {
			enable = true, -- Activa mejoras visuales
			update_debounce = 200, -- Milisegundos antes de actualizar UI
			max_file_length = 5000, -- Líneas máximas para renderizado especial

			-- Casillas de verificación: - [ ] tarea
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" }, -- Pendiente
				["x"] = { char = "", hl_group = "ObsidianDone" }, -- Completada
				-- [">"] = { char = "", hl_group = "ObsidianRightArrow" },  -- Reenviada
				-- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },      -- Cancelada
				-- ["!"] = { char = "", hl_group = "ObsidianImportant" },  -- Importante
			},

			-- Enlaces externos con ícono
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },

			-- Símbolos de referencia
			-- reference_text = { hl_group = "ObsidianRefText" },
			-- highlight_text = { hl_group = "ObsidianHighlightText" },
			-- tags = { hl_group = "ObsidianTag" },
			-- block_ids = { hl_group = "ObsidianBlockID" },

			hl_groups = {
				-- Puedes personalizar colores aquí si quieres
				-- ObsidianTodo = { bold = true, fg = "#f78c6c" },
				-- ObsidianDone = { bold = true, fg = "#89ddff" },
				-- ObsidianBullet = { bold = true, fg = "#89ddff" },
			},
		},

		-- ============================================
		-- YAML FRONTMATTER
		-- ============================================
		-- Campos que prefieres ver al inicio del archivo
		-- preferred_link_style = "wiki",  -- Usa [[wikilinks]] por defecto
		-- disable_frontmatter = false,  -- Habilita YAML frontmatter

		-- ============================================
		-- CALLBACKS Y EVENTOS
		-- ============================================
		-- callbacks = {
		--   -- Se ejecuta después de crear una nota
		--   post_setup = function(client) end,
		--
		--   -- Se ejecuta al entrar a un buffer de Obsidian
		--   enter_note = function(client, note) end,
		--
		--   -- Se ejecuta al salir de un buffer
		--   leave_note = function(client, note) end,
		--
		--   -- Se ejecuta antes de escribir un buffer
		--   pre_write_note = function(client, note) end,
		--
		--   -- Se ejecuta después de escribir
		--   post_write_note = function(client, note) end,
		-- },

		-- ============================================
		-- OTRAS OPCIONES AVANZADAS
		-- ============================================
		-- use_advanced_uri = false,  -- Usa URIs de Obsidian avanzadas
		-- open_app_foreground = false,  -- Trae Obsidian al frente al abrir
		-- log_level = vim.log.levels.INFO,  -- Nivel de logging
	},

	-- ============================================
	-- ATAJOS DE TECLADO
	-- ============================================
	keys = {
		-- Buscar o crear nota
		{ "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Buscar/crear nota" },

		-- Buscar dentro de las notas
		{ "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Buscar en notas" },

		-- Crear nueva nota
		{ "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "Nueva nota" },

		-- Nota diaria de hoy
		{ "<leader>nt", "<cmd>ObsidianToday<cr>", desc = "Nota de hoy" },

		-- Nota diaria de ayer
		{ "<leader>ny", "<cmd>ObsidianYesterday<cr>", desc = "Nota de ayer" },

		-- Abrir en Obsidian app
		{ "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "Abrir en Obsidian" },

		-- Backlinks (notas que enlazan a esta)
		{ "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "Ver backlinks" },

		-- Tags
		{ "<leader>ng", "<cmd>ObsidianTags<cr>", desc = "Buscar por tags" },

		-- Convertir selección a enlace
		{ "<leader>nl", "<cmd>ObsidianLink<cr>", mode = "v", desc = "Crear enlace" },

		-- Crear nueva nota desde selección
		{ "<leader>nN", "<cmd>ObsidianLinkNew<cr>", mode = "v", desc = "Nueva nota desde selección" },

		-- Extraer selección a nueva nota
		{ "<leader>nx", "<cmd>ObsidianExtractNote<cr>", mode = "v", desc = "Extraer a nueva nota" },

		-- Pegar imagen desde clipboard
		{ "<leader>np", "<cmd>ObsidianPasteImg<cr>", desc = "Pegar imagen" },

		-- Renombrar nota
		{ "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "Renombrar nota" },

		-- Template (aunque no las uses, por si acaso)
		-- { "<leader>nT", "<cmd>ObsidianTemplate<cr>", desc = "Insertar template" },

		-- Alternar checkbox
		-- { "<leader>nc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle checkbox" },
	},
}
