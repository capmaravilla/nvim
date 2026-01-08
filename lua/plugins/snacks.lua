return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile   = { enabled = true },
    quickfile = { enabled = true },
    notifier  = { enabled = true },
    input     = { enabled = true },
    toggle    = { enabled = true },

    -- desactivados conscientemente
    picker        = { enabled = false },
    explorer      = { enabled = false },
    indent        = { enabled = false },
    dashboard     = { enabled = false },
    image         = { enabled = false },
    scope         = { enabled = false },
    scroll        = { enabled = false },
    statuscolumn  = { enabled = false },
    words         = { enabled = false },
  },  
  -- keys = {
  -- -- Top Pickers & Explorer
  --   { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
  --   { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
  --   { "<leader>'", function() Snacks.picker.grep() end, desc = "Grep" },
  --   { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
  --   { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
  --   { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  -- },
}
