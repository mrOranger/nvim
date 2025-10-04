return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        enabled = true,
        config = function ()
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 250,
                },
            })
        end,
    }
}
