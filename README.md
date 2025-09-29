# NeoVim

NeoVim is an open-source project expanding features of [Vim](https://www.vim.org/) code editor, using [Lua](https://www.lua.org/). NeoVim is not ad IDE, thus, it does not offer any additional feature rather than code editing. On the other hand, it is fully customizable, therefore is an interesting starting point to create a flexible and comfortable endivornimento for development.

If you are using a UNIX system, you can easily install Neovim using [Homebrew](https://brew.sh/) (if you are working with a Mac) or APT (if you are working with Linux). Once NeoVim has been installed, all configuration file must be placed inside `~/.config/nvim` folder. Which is the main folder where NeoVim will looking for configuration's files.  

I won't focus on Lua and Vim, therefore, I'm going to describe how the repository is made, and the main files that togheter compose the whole configuration. The entrypoint is [init.lua](.init.lua); in Lua, each `init.lua` file is the first file that will be executed inside the folder. In a certain sense it can be compared with Typescrip barrel files. 

Inside the `init.lua` we are requiring additional files, that are: [`options.lua`](./lua/core/options.lua), and [`lazy.lua`](./lua/core/lazy.lua). Each of these files are placed inside `lua/core` folder, since the folder `lua` is a folder considered to be in the standard path of the computer, from the Lua interpreter. Requiring a file, can be done using the istruction `require()` followed by the name of the file, and using dots indicating eventually folders. E.g.: `require("core/lazy")`, will looking for a file named `lazy` inside the `core` folder. 

## Lazy Package Manager

Theare are many different package managers development by NeoVim, on the other hand I will use [`lazy.nvim`](https://github.com/folke/lazy.nvim). The file [`lazy.lua`](./lua/core/lazy.lua) contains the basis instructions to setup Lazy, moreover, using the config function, we can provide a set of packages that Lazy will download and integrate inside our configuration.
