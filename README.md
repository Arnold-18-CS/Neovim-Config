# Neovim Configuration Repository

This repository contains the Neovim configuration files, setup instructions, and installations required for optimal development on Kali Linux with Python, Vim, and other tools.

## Prerequisites

Before setting up Neovim with the configuration files in this repository, ensure you have the following installed:

- **Neovim**: Ensure that you have [Neovim](https://neovim.io/) installed.
- **Python 3**: Install Python 3 for plugin support, LSP, and virtual environments. (add any other languages you might need as well)
- **Vim**: This repository assumes that you have Vim installed, with the path added to the system `PATH` (See **Setting up Vim** below).

---

## 1. Install Neovim

Install Neovim from the [official site](https://neovim.io/), or use your package manager:

```bash
sudo apt install neovim
```

## 2. Install Required Python Modules

Install the necessary Python modules for Neovim support and plugin management. You'll need the following:

```bash
pip install pynvim
```
If you encounter issues related to "externally managed environments", refer to Kali's Python setup.

For setting up a virtual environment:

```bash
# Create a virtual environment
python3 -m venv path/to/venv
```

Activate the virtual environment
```bash
source path/to/venv/bin/activate
```

Install Python dependencies in the venv
```bash
pip install pynvim
```

## 3. Install Neovim Plugins
### Plugin Manager: LazyVim
This configuration uses the LazyVim package manager to handle plugin installations. To get started, you need to install the following:
1. Ensure `git` is installed as we pull the plugins from Github 
```bash
sudo apt install git
```
2. Install LazyVim, in the `init.lua` file:
```lua
-- Sample LazyVim plugin setup (assuming you use lazyvim)
require('lazy').setup({
    -- Example plugin setup
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    },
    {
        'neovim/nvim-lspconfig',
    },
    -- Additional plugins...
})
```

## 4. Setting Up LSP for Python
Make sure Python language server and tools are installed:

Install LSP Server: Install the pyright language server using Mason:

```bash
:MasonInstall pyright
```
Alternatively, you can manually install pyright:

```bash
npm install -g pyright
```

Configure Neovim's LSP for Python (in init.lua):

```lua
require'lspconfig'.pyright.setup{}
```

## 5. Setting Up Treesitter
To ensure proper syntax highlighting and code parsing, you must set up nvim-treesitter. Ensure Neovim 0.10 or newer is installed for this plugin to work.

Install Treesitter: Treesitter can be installed via LazyVim. This configuration automatically installs Treesitter plugins with:

```lua
require'nvim-treesitter.configs'.setup {
    ensure_installed = "python",  -- Install Python parser
    highlight = {
        enable = true,              -- Enable syntax highlighting
    },
}
```
Install parser: After configuration, install the Treesitter parser for Python:

```bash
:TSInstall python
```
For grammar-based parser installations:

```bash
:TSInstallFromGrammar python
```

You may see warnings about needing a tree-sitter executable. If needed, install it using:

```bash
sudo apt install tree-sitter-cli
```
