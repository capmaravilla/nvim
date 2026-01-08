return {
	-- "Shatur/neovim-ayu",
	-- "rebelot/kanagawa.nvim",
  -- "catppuccin/nvim",
  'wuelnerdotexe/vim-enfocado',
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.cmd([[colorscheme ayu]])
		-- vim.cmd([[colorscheme kanagawa]])
		-- vim.cmd([[colorscheme catppuccin]])
		vim.cmd([[colorscheme enfocado]])

		-- Hacer el fondo transparente
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
		vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	end,
}
