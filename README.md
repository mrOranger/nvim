# NeoVim

<div style="display: flex; flex-direction: row; justify-content: center; align-items: center">
    <img src="./assets/NeoVim.png" alt="NeoVim Logo" style="width: 100%"/>
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

## Keybindings
Inside [`keybindings.lua`](./lua/core/keybindings.lua) file, you can find all the keybindings of this project. To identify new keys from older once, I use the `<Space>` key as leader. Doing this, each new command must start by pressing `<Space>` before being executed. The complete list of the keys is the following:

* `<Leader>q` is used to close the current NeoVim buffer, without saving.
* `<Leader>Q` is used to force the closure of the current NeoVim buffer, without saving.
* `<Leader>w` is used to write the current buffer.
* `<Leader>W` is used to force writing of the current buffer.
* `<Leader>x` is used to close all the open buffer.
* `<Leader>X` is used to force closing all the open buffer. In a certain sense, this is a kill operation, forcing NeoVim to be closed completely.

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

One of the most powerful feature of tree-sitter is the abiity to use the generated abstract syntax tree for code highlighting. In fact, using the `incremental_selection` field, we can bind some key combinations to select part of the code, referring to nodes of the abstract syntax tree. E.g.:

```lua
incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = "<Leader>ss",
        node_incremental = "<Leader>si",
        node_decremental = "<Leader>sd",
    },
},
```

* `init_selection = "<Leader>ss"` start the selection process of tree-sitter. `ss` -> "start selection";
* `node_incremental = "<Leader>si"` increments the selection to the next node of the abstract syntax tree. `si` -> "selection increment".
* `node_decremental = "<Leader>sd"` decrements the selection to the previous node of the abstract syntax tree. `sd` -> "selection decrement".

Up to this point, tree-sitter offers powerful features to select in a smart way piece of the text. Moreover, we can use another plugin of tree-sitter known as [`nvim-treesitter-objects`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects), implements additional smart movements inside the text. Just like the "normal" version of tree-sitter, inside the `config` function some additional options are passed:

```lua
textobjects = {
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ["fo"] = { query = "@function.outer", desc = "Select outer part of a function" },
            ["fi"] = { query = "@function.inner", desc = "Select inner part of a function" },
            ["co"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["ci"] = { query = "@class.inner", desc = "Select inner part of a class" },
        },
        include_surrounding_whitespace = true,
    },
},
```

I will not focus on each of the following options, however, I will explain only the most important one, that is `keymaps`. Inside this table, we can define additional movements to combine with the normal NeoVim motions, to make the selection of specific part of the code easier. That is:

* By pressing `fo` we select all the content of a function plus the outer content of itself.
* `fi` is just like `fo` with the difference that only the inner part of a functon is selected.
* Moreover, motions having with prefix `c` works in the same way but just for class objects, that is: `co` select all the class declaration; `ci` select just the inner part of a class declaration.


