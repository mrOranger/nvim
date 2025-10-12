return {
    {
        "rose-pine/neovim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme("rose-pine")
        end,
    },
}
