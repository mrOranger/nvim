return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme("nightfox")
        end,
    }
}
