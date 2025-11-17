return {
    {
        "sainnhe/everforest",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.g.everforest_transparent_background = true
            vim.cmd.colorscheme("everforest")
        end,
    }
}
