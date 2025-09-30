# NeoVim

<div style="display: flex; flex-direction: row; justify-content: center; align-items: center">
    <img src="./assets/nvim-logo.png" alt="NeoVim Logo" style="width: 100%"/>
</div>

NeoVim is an open-source code editor based on [Vim](https://www.vim.org/), and made using [Lua](https://www.lua.org/). NeoVim is not ad IDE, thus, it does not offer any additional feature rather than code editing. On the other hand, it is fully customizable, therefore is an interesting starting point to create a flexible and comfortable endivorniment for development. Moreover, I think that using a code editor rather than an IDE is a better approach to develop and learn new programming' skills. In fact, it is quite simple to import a dependencies pressing a code action button, or using auto-completion rather than remembering keywords or istructions' names. 

If you are using a UNIX system, you can easily install Neovim using [Homebrew](https://brew.sh/) (if you are working with a Mac) or APT (if you are working with Linux). Once NeoVim has been installed, any customization is made using Lua, by placing the configuration's files inside `~/.config/nvim` folder. Which is the main folder where NeoVim will looking for configuration's files.  

I won't focus on Lua and Vim, therefore, I'm going to describe how the repository is made, and the main files that togheter compose the whole configuration. The entrypoint is [init.lua](.init.lua); in Lua, each `init.lua` file is the first file that will be executed inside the folder. In a certain sense it can be compared with Typescript barrel files. 

Inside the `init.lua` using the `require` keyword we are importing some dependencies: 
* [`options.lua`](./lua/core/options.lua), where Vim's default options are updated using the global table variable `vim` through the `opt` item:
* Inside [`lazy.lua`](./lua/code/lazy.lua) there is the Lazy package manager definition;

## Lazy Package Manager

Theare are many different package managers development for NeoVim, on the other hand I will use [`lazy.nvim`](https://github.com/folke/lazy.nvim). The file [`lazy.lua`](./lua/core/lazy.lua) contains the basis instructions to setup Lazy, however, the most important part of this file is represented by the following instruction:

```lua
require("lazy").setup({
    { 
        "rebelot/kanagawa.nvim",
        config = function ()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
})
```

using `require` and `setup` we can indicate the set of dependencies that will be downloaded and installed by Lazy as a set of tables. Moreover, the `config` function is used as a callback to execute come once the dependency has been succesuflly installed.

## Plugins

The most important part of this project is composed by the set of plugins that are installed and configurated. Thankfully, each dependency can be customized based on our need, moreover, I will describe the dependencies that I'm going to use and how can be customized.

### Tree-sitter

Tree-sitter is a parser used to create syntax-tree of current file, capable of updating the abstract syntax tree while the file is updated. NeoVim includes Tree-sitter in its default configuration, however, in order to use it with other parsers, we have to include the [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) plugin. 

Installing tree-sitter requires to add a new dependency to the list of those already defined inside Lazy configuration file. Moreover, tree-sitter is not enabled by default, therefore, we have to include some instructions inside the `config` callback:

```lua
{
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            auto_install = true,
            highlight = {
                enabled = true,
            },
        })
    end,
},
```

By default, tree-sitter indicates that the parsers defined with the `ensure_installed` field should always be included; any additional parser will be installed if specified inside this table. However, `auto_install` allows NeoVim to install automatically a new parser whenever an unknown syntax is read. Finally, using `highlight` we are enabling syntax hightling feature of tree-sitter. There are many different configurations that can be included in the previous one. However, the most importat thing to notice is that now, we can customize any part of the abstract syntax tree defined by tree-sitter.
