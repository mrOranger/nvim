return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            require("kanagawa").setup({
                transparent = true
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    }
}

