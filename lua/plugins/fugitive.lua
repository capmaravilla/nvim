-- ============================================
-- VIM-FUGITIVE: INTEGRACIÓN CON GIT
-- ============================================
-- Plugin para trabajar con Git directamente desde Neovim
-- Proporciona comandos y funciones para gestionar repositorios Git

return {
	"tpope/vim-fugitive",
	-- Solo carga cuando usas comandos Git (lazy loading)
	cmd = { "G", "Git" },
	keys = {
		-- Actualiza todas las ramas remotas y elimina referencias obsoletas
		{ "<leader>ga", ":Git fetch --all -p<cr>", desc = "Git fetch" },
		-- Descarga y fusiona cambios del repositorio remoto
		{ "<leader>gp", ":Git pull<cr>", desc = "Git pull" },
		-- Otros mapeos útiles que puedes añadir:
		-- { "<leader>gs", ":Git<cr>", desc = "Git status" },
		-- { "<leader>gc", ":Git commit<cr>", desc = "Git commit" },
		-- { "<leader>gp", ":Git push<cr>", desc = "Git push" },
		-- { "<leader>gd", ":Gdiffsplit<cr>", desc = "Git diff" },
		-- { "<leader>gb", ":Git blame<cr>", desc = "Git blame" },
		-- { "<leader>gL", ":Git log<cr>", desc = "Git log" },
	},
	-- Comandos principales de Fugitive:
	-- :G o :Git          - Abre el status de Git
	-- :Gwrite            - Añade el archivo actual al staging
	-- :Gread             - Restaura el archivo desde el índice
	-- :Gdiffsplit        - Muestra diferencias en un split
	-- :Gblame            - Muestra quién modificó cada línea
	-- :Glog              - Muestra el historial de commits
}
