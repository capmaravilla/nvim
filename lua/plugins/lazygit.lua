return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
        { "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit on current file" },
    },
    config = function()
        -- Opcionales: controla transparencia, escala y bordes de la ventana flotante
        vim.g.lazygit_floating_window_winblend = 0
        vim.g.lazygit_floating_window_scaling_factor = 0.9
        vim.g.lazygit_floating_window_border_chars = {
            "╭", "─", "╮", "│", "╯", "─", "╰", "│"
        }
        -- Usa nvim-remote si tienes nvr instalado (mejor para editar commits)
        vim.g.lazygit_use_neovim_remote = 1
    end,
}

