return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        enabled = true,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            vim.keymap.set("n", "<C-n>rr", ":Neotree filesystem revel right")
            vim.keymap.set("n", "<C-n>rl", ":Neotree filesystem reveal left")
        end,
    }
}
