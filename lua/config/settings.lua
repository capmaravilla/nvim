vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Este lo tenemos actualmente en lazy.lua
--vim.g.mapleader = " " 

--Otras configuraciones
--vim.opt.wrap = true


vim.diagnostic.config({
  virtual_text = true
})
