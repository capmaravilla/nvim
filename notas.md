Estoy configurando NVim, quiero instalar LazyGit, ahora mismo estoy trabajando con vim-fugitive y gitsigns, y me gustaria instar LazyGit para trabajar en conjunto. Puedes hacerme la configuracion del plugin para LazyGit y te paso los dos plugins que te mencione por si hubiera que cambiarles algo.



=== vim-fugitive ===

return {
    "tpope/vim-fugitive",
	cmd = { "G", "Git" },
	keys = {
		{ "<leader>ga", ":Git fetch --all -p<cr>", desc = "Git fetch" },
		{ "<leader>gl", ":Git pull<cr>", desc = "Git pull" },
}

=== fin del archivo ===


=== gitsigns ===

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signcolumn = false,
		numhl = true,
		max_file_length = 10000,
    },
    }

=== fin del archivo ===
