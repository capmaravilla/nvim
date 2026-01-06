return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      globalstatus = true,
    },
    sections = {
      lualine_c = {{"filename", file_status = true, path = 1,}},
      inactive_winbar = {
        lualine_c = {"filename"},
      },
    },
  },
}
