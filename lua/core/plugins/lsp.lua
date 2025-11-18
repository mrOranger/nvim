return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        enabled = true,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function ()
            require("mason").setup({
                automatic_enable = true,
            })

            require("mason-lspconfig").setup({
                ensure_installed = { "clangd" }
            })

            vim.diagnostic.config({
                virtual_text = true,
                virtual_line = true,
            })
            
            vim.lsp.start({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                }
            })
        end,
    }
}
