-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Muestra números de línea relativos (útil para movimientos)
vim.opt.relativenumber = true
-- Resalta la línea donde está el cursor
vim.opt.cursorline = true
-- Elimina el carácter "~" al final del buffer (más limpio)
vim.opt.fillchars = { eob = " " }
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true
-- Integra el portapapeles de Neovim con el del sistema
-- Permite copiar/pegar entre Neovim y otras aplicaciones
vim.opt.clipboard = "unnamedplus"
-- Número de espacios al insertar un tab
vim.opt.softtabstop = 2
-- Convierte tabs en espacios (recomendado para consistencia)
vim.opt.expandtab = true
-- Número de espacios para indentación automática
vim.opt.shiftwidth = 2
-- Otras opciones relacionadas:
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
-- DIAGNÓSTICOS LSP
-- Configura cómo se muestran los errores y advertencias del LSP
vim.diagnostic.config({
	virtual_text = true, -- Muestra errores en línea como texto virtual
})
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
