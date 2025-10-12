return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme("nord")
        end,
    }
}
