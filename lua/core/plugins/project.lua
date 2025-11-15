return {
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                detection_methods = { "pattern", "lsp" },
                patterns = { ".git", "package.json", "Cargo.toml", "go.mod" },
            }
            require('telescope').load_extension('projects')
        end
    }
}
