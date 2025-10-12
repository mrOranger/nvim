return {
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            require("github-themes").setup({})
            vim.cmd.colorscheme("github_dark")
        end,
    }
}
