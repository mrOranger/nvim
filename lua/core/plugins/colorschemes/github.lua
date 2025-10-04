return {
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        enabled = false,
        config = function ()
            require("github-themes").setup({})
            vim.cmd.colorscheme("github_dark")
        end,
    }
}
