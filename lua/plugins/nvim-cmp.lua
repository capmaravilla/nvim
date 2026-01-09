-- ============================================
-- NVIM-CMP: SISTEMA DE AUTOCOMPLETADO
-- ============================================
-- Plugin de autocompletado para Neovim
-- IMPORTANTE: Los mapeos de <Tab> y <S-Tab> aquí solo funcionan en modo INSERT
-- En modo normal, <Tab> y <S-Tab> están mapeados a navegación de buffers (ver settings.lua)

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Completado desde el buffer actual (palabras que ya has escrito)
		"hrsh7th/cmp-buffer",
		-- Completado de rutas de archivos (útil al escribir rutas)
		"hrsh7th/cmp-path",
		-- Otras fuentes de autocompletado que puedes añadir:
		-- "hrsh7th/cmp-nvim-lsp",      -- Completado desde LSP (recomendado)
		-- "hrsh7th/cmp-nvim-lua",      -- Completado para Lua/Neovim API
		-- "saadparwaiz1/cmp_luasnip",  -- Snippets (necesita luasnip)
		-- "hrsh7th/cmp-cmdline",       -- Completado en línea de comandos
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			-- Mapeos de teclado para el menú de autocompletado
			-- IMPORTANTE: Estos mapeos solo funcionan en modo INSERT
			mapping = cmp.mapping.preset.insert({
				-- Abre el menú de autocompletado
				["<C-Space>"] = cmp.mapping.complete(),
				-- Confirma la selección y la inserta
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- Navega al siguiente item (solo en modo insert)
				["<Tab>"] = cmp.mapping.select_next_item(),
				-- Navega al item anterior (solo en modo insert)
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				-- Otras opciones de mapeo disponibles:
				-- ["<C-n>"] = cmp.mapping.select_next_item(),  -- Alternativa a Tab
				-- ["<C-p>"] = cmp.mapping.select_prev_item(),  -- Alternativa a S-Tab
				-- ["<C-y>"] = cmp.mapping.confirm({ select = false }),  -- Confirma sin seleccionar
				-- ["<C-e>"] = cmp.mapping.abort(),  -- Cierra el menú
				-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),  -- Scroll docs hacia arriba
				-- ["<C-d>"] = cmp.mapping.scroll_docs(4),  -- Scroll docs hacia abajo
			}),
			-- Fuentes de autocompletado (orden importa: se muestran en este orden)
			sources = {
				{ name = "buffer" },  -- Palabras del buffer actual
				{ name = "path" },    -- Rutas de archivos
				-- Otras fuentes que puedes añadir:
				-- { name = "nvim_lsp" },  -- LSP (recomendado)
				-- { name = "nvim_lua" },  -- API de Neovim
				-- { name = "luasnip" },   -- Snippets
			},
			-- Otras opciones de configuración:
			-- completion = {
			--   keyword_length = 1,  -- Empieza a sugerir después de 1 carácter
			--   completeopt = "menu,menuone,noinsert",  -- Comportamiento del menú
			-- },
			-- snippet = {
			--   expand = function(args)
			--     require("luasnip").lsp_expand(args.body)
			--   end,
			-- },
			-- formatting = {
			--   format = function(entry, vim_item)
			--     -- Personaliza cómo se muestran los items
			--     return vim_item
			--   end,
			-- },
			-- window = {
			--   completion = cmp.config.window.bordered(),  -- Borde en el menú
			--   documentation = cmp.config.window.bordered(),  -- Borde en la documentación
			-- },
		})
	end,
}
