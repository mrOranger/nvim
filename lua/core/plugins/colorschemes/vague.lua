return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            require("vague").setup()
            vim.cmd.colorscheme("vague")
        end,
    }
}
