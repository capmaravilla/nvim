vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Mappings
vim.keymap.set("n","<Tab>", vim.cmd.bnext)
vim.keymap.set("n","<S-Tab>", vim.cmd.bprevious)
-- vim.keymap.set("n","<leader>o", "o<Esc>k")

--Otras configuraciones
--vim.opt.wrap = true


--Activamos las hints de LSP
vim.diagnostic.config({
  virtual_text = true
})

--keymap para el formateo de textos
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "Format buffer (Conform)" })

