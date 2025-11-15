return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        enabled = true,
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()

            local builtin = require("telescope.builtin")
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local actions = require("telescope.actions")
            local state = require("telescope.actions.state")
            local conf = require("telescope.config").values

            local custom_commands = {
                {
                    name = "Force to save current buffer",
                    cmd = "w!",
                    description = "Force to save the current buffer",
                },
                {
                    name = "Force to save all buffers",
                    cmd = "wa!",
                    description = "Force to save all buffers",
                },
                {
                    name = "Force to close current buffer",
                    cmd = "q!",
                    description = "Force to close current buffer",
                },
                {
                    name = "Force to close all buffers",
                    cmd = "qa!",
                    description = "Force to close all buffers",
                },
                {
                    name = "Force to save and close current buffer",
                    cmd = "wq!",
                    description = "Force to save and close current buffer",
                },
                {
                    name = "Force to save and close all buffers",
                    cmd = "wqa!",
                    description = "Force to save and close all buffers",
                },
                {
                    name = "Display Syntax Tree",
                    cmd = "InspectTr",
                    description = "Display TreeSitter abstract syntax tree",
                },
                {
                    name = "Change Telescope Colorscheme",
                    cmd = "Telescope colorscheme",
                    description = "Change current colorscheme",
                },
                {
                    name = "Find File",
                    cmd = "Telescope find_files",
                    description = "Open Telescope file finder",
                },
                {
                    name = "Find in current file",
                    cmd = "Telescope current_buffer_fuzzy_find",
                    description = "Open Telescope finder function",
                },
                {
                    name = "Select current file with Harpoon",
                    cmd = "lua require('harpoon').setup():list():add()",
                    description = "Select current file with Harpoon",
                },
                {
                    name = "Remove current file from Harpoon",
                    cmd = "lua require('harpoon').setup():list():remove()",
                    description = "Remove current file from Harpoon selected ones",
                },
                {
                    name = "Show Harpoon quick menu",
                    cmd = "lua require('harpoon').ui:toggle_quick_menu(harpoon:list())",
                    description = "Show Harpoon selected files",
                },
            }

            local function run ()

                local function attach (prompt_bufnr)
                    actions.select_default:replace(function()
                        local selection = state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.cmd(selection.value.cmd)
                    end)
                    return true
                end

                local finder = finders.new_table({
                    results = custom_commands,
                    entry_maker = function(entry)
                        return {
                            value = entry,
                            ordinal = entry.name .. " " .. entry.description,
                            display = function (table)
                                local displayer = require("telescope.pickers.entry_display").create({
                                    separator = " │ ",
                                    items = {
                                        { width = 25 },
                                        { remaining = true },
                                    },
                                })
                                return displayer({
                                    table.value.name,
                                    { table.value.description, "TelescopeResultsComment" },
                                })
                            end,
                        }
                    end,
                })

                local picker_opts = {
                    prompt_title = "Run Commands",
                    finder = finder,
                    sorter = conf.generic_sorter({}),
                    attach_mappings = attach,
                    layout_strategy = "center",
                    layout_config = {
                        width = 0.4,
                        height = 0.4,
                        preview_cutoff = 1,
                    },
                }

                local new_picker = pickers.new({}, picker_opts)
                new_picker:find()

            end

            vim.keymap.set("n", "<leader>p", builtin.buffers)
            vim.keymap.set("n", "<leader>P", run)

            vim.keymap.set("n", "<C-t>ff", builtin.find_files)
            vim.keymap.set("n", "<C-t>lg", builtin.live_grep)
            vim.keymap.set("n", "<C-t>c", builtin.colorscheme)
            vim.keymap.set("n", "<C-t>gc", builtin.git_commits)
            vim.keymap.set("n", "<C-t>gb", builtin.git_branches)
            vim.keymap.set("n", "<C-t>sd", builtin.diagnostics)

        end,
    },

}
