return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        enabled = true,
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local builtin = require('telescope.builtin')

            vim.keymap.set("n", "<C-t>ff", builtin.find_files)
            vim.keymap.set("n", "<C-t>lg", builtin.live_grep)
            vim.keymap.set("n", "<C-t>c", builtin.colorscheme)
            vim.keymap.set("n", "<C-t>gc", builtin.git_commits)
            vim.keymap.set("n", "<C-t>gb", builtin.git_branches)
            vim.keymap.set("n", "<C-t>sd", builtin.diagnostics)
        end,
    },

}
