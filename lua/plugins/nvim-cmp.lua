-- Autocompletado básico
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer", -- Completado desde el buffer actual
		"hrsh7th/cmp-path", -- Completado de rutas de archivos
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),
			sources = {
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end,
}
