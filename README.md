
<div style = "width: 100%; height: fit-content; display: flex; justify-content: center; align-items: center">
    <img 
        src = "./assets/NeoVim.png" 
        alt = "NeoVim Logo" 
        style = "width: 30%; height: 30%; max-width: 200px; min-width: 100px; margin: 2em 4em" />
</div>

#### Setup 

Before download and install this project, please <u>ensure you have a C compiler installed successfully in your 
device</u>, and a NeoVim distribution. This project has been <u>created with the `0.11` version of NeoVim</u> (you can
check the version of your NeoVim distribution using `nvim --version` command). Once you are sure about the 
previous requirements, you can install this project in these steps:

1. Clone the content of this repository through `git clone https://github.com/mrOranger/nvim` 
    inside the `~/.config/nvim` folder.

2. Run your NeoVim installation `nvim`. Then, all the dependencies and packages will be automatically installed by Lazy
    package manager.

# Introduction

What is the difference between __Vi__, __Vim__ and __NeoVim__? Why shall we use a raw code editor like __NeoVim__, rather 
a than fully features IDE just like those my by __JetBrains__ or a more completed code editor such as __VsCode__? If you
would like to know an answer to these questions you are in the right place. 

In this repository, we will have a look on __NeoVim__, and I will share with you my personal configuration. Moreover, I
will not limit myself to share the code and nothing more, insted, in this repository we will have a look on each
plugin that I chose, and how they actually interact each other. 

Before starting with a short introduction in the historical background of __Vim__ and __NeoVim__, I would like to share 
with you a personal tought about __NeoVim__. In my daily work, I always use __VsCode__ or __IntelliJ__, however, 
sometimes I think that those powerfull instruments, makes too easy our developments' lifes, making ourselves "lazy" in
such a way. It is easy to press a single button to compile and run your C code, or importing a library, however, 
we do not have any idea about which command is used to make a task just like compiling our code, or we do not ask
ourself: "Why is this component inside `@angular/core` rather than in another place?". Moreover, I'm a fan of the
[UNIX Phylosophy](https://en.wikipedia.org/wiki/Unix_philosophy) and the qoute "Make one thing and make I good", thus,
I prefer to have a minimal setup, rather than a tons of features that I will not probably quite often, and when I 
discovered __Vim__ first and __NeoVim__ latter, I though that it was a good idea to invest some time to learn this code 
editor.

Last but not least, I reccomend to you to have a look on these videos, that inspired me in making this repository:

* [Understanding NeoVim](https://www.youtube.com/watch?v=87AXw9Quy9U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAfté).
* [From 0 to IDE in NEOVIM from scratch](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=1&t=892s)

## Historical Background

While __NeoVim__ is born in 2014, it is based on a older code editor known as [__Vi__](https://it.wikipedia.org/wiki/Vi_(software)). __Vi__ is born in 1976, made by [Bill Joy](https://it.wikipedia.org/wiki/Bill_Joy) and can be considered one of the
first visual editor ever made. However, the __Vim__ and __NeoVim__ motions `hjkl` used to navigate through the code are 
inherited just by __Vi__. In fact, in the earlier keyboard models used in devices where __Vi__ was installed, 
the arrows have not been used yet, therefore, to move around the text, they were encoded inside the `hjkl` keys.

In 1991, [__Vim__](https://en.wikipedia.org/wiki/Vim_(text_editor)) is born. New features were included, and 
improvements were made respect to __Vi__. In fact, __Vim__ will be adopted as pre-installed code editor in most of UNIX
systems, and even in __DOS__. However, since __Vim__ is an open-source project born from __Vi__,it contains a lot of 
integrations and plugins for older and no more used architectures.

Finally, in 2014 __NeoVim__ was released. Respect to __Vim__, __NeoVim__ focuses on re-write most of __Vim__ 
capabilities, using [__Lua__](https://en.wikipedia.org/wiki/Lua). Moreover, __NeoVim__ contains a native support 
for [__Tresitter__](https://en.wikipedia.org/wiki/Tree-sitter_(parser_generator)), and just like __VsCode__, 
it supports [__LSP__](https://en.wikipedia.org/wiki/Language_Server_Protocol) and 
[__DAP__](https://microsoft.github.io/debug-adapter-protocol//) protocols.

## Plugins and Configuration

In this section, we are going to analyse the installed dependencies and the Vim options that have been used for this
distribution. An exhaustive list of the installed packages is the following:

* [Lazy](https://github.com/folke/lazy.nvim?tab=readme-ov-file) is a plugin mananger for NeoVim. There are many others
  plugin managers, such as: [Packer](https://github.com/wbthomason/packer.nvim); or [Vim-Plug](https://github.com/junegunn/vim-plug); however, is a mine personal preferences to use Lazy instead of another.

* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter). As I mentioned before, NeoVim includes a native
  installation of TreeSitter, however, this package is used to simplify the interaction between the code editor and the
  syntax parser.

* I love [Telescope](https://github.com/nvim-telescope/telescope.nvim), in fact, one of the main reason that lead me to
  use NeoVim rather than Vim or VsCode was this plugin.

* [NeoTree](https://github.com/nvim-neo-tree/neo-tree.nvim) is a file explorer that you can use to navigate from the
  file inside of the current project.

* Navigation between some specific file is made easier using [Harpoon](https://github.com/ThePrimeagen/harpoon).

* LSP is managed by [Mason](https://github.com/mason-org/mason.nvim) and [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim) packages.

* Using LSP with a code completion creates a better user experience. The completion engine that I choose is [Blink](https://github.com/Saghen/blink.cmp).

These are the main packages of this configuration. However, additional packages are used for layout and enhance the
coding experience: [Alpha](https://github.com/goolord/alpha-nvim) shows a pretty splash page when NeoVim in started;
[Autopairs](https://github.com/windwp/nvim-autopairs) close automatically a brackets once it is opened; Interaction
between Git and NeoVim is made easier with [git-signs](https://github.com/lewis6991/gitsigns.nvim), in fact, you will
notice that guidelines in the left-hand side of the current buffer are shown to indicate the added and removed part of
the file from the previous version; [Lualine](https://github.com/nvim-lualine/lualine.nvim) display a prettier bottom
bar including some information about the curren buffer; Surround pieces of code authomatically is managed by
[nvim-surround](https://github.com/kylechui/nvim-surround).

Last but not list, some colorschemes have been places inside the [`colorscheme`](./lua/core/plugins/colorschemes)
folder. If you are interested in installing a new colorscheme, check this [link](https://github.com/topics/neovim-colorscheme).

