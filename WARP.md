# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a modern Neovim configuration repository using LazyVim as the plugin manager. The configuration is designed for multi-language development with a focus on Python, Lua, and Dart/Flutter development, featuring LSP integration, debugging capabilities, and a rich UI experience.

## Architecture

### Core Structure
```
├── init.lua                 # Entry point - bootstraps LazyVim and loads core modules
├── lua/
│   ├── vim-options.lua      # Basic Neovim settings (leader key, indentation, line numbers)
│   ├── remaps.lua          # Custom key mappings and shortcuts
│   └── plugins/            # LazyVim plugin configurations (modular approach)
│       ├── lsp-config.lua  # Language servers, Mason, and completion setup
│       ├── telescope.lua   # Fuzzy finder and file navigation
│       ├── treesitter.lua  # Syntax highlighting and parsing
│       ├── debugging.lua   # DAP debugging configuration
│       ├── neotree.lua     # File explorer
│       ├── alpha.lua       # Dashboard/start screen
│       ├── lualine.lua     # Status line with custom theme
│       ├── catppuccin.lua  # Color scheme
│       ├── completions.lua # Auto-completion setup
│       ├── none-ls.lua     # Formatting and linting
│       └── icons.lua       # Icon configuration
├── lazy-lock.json          # Plugin version lock file
└── quick_keys.md           # User reference for shortcuts
```

### Plugin Management
- **LazyVim**: Modern plugin manager with lazy loading
- Each plugin is configured in separate files under `lua/plugins/`
- Plugin configurations return table-based specs for LazyVim
- Uses `lazy-lock.json` for reproducible plugin versions

### Language Support Architecture
- **LSP**: Centralized in `lsp-config.lua` using Mason for server management
- **Completion**: `nvim-cmp` with multiple sources (LSP, snippets, buffer, path)
- **Debugging**: DAP integration with UI for Python debugging
- **Syntax**: TreeSitter for enhanced syntax highlighting and parsing

## Key Commands and Workflows

### Essential Development Commands
```bash
# Open Neovim in current directory
nvim .

# Open specific file
nvim filename.ext
```

### Plugin-Specific Commands (within Neovim)
```vim
" Mason - Manage language servers
:Mason
:MasonInstall pyright  " Install Python language server
:MasonInstall lua_ls   " Install Lua language server

" TreeSitter - Manage parsers
:TSInstall python      " Install Python parser
:TSUpdate             " Update all parsers

" Telescope - File navigation
:Telescope find_files
:Telescope live_grep
:Telescope oldfiles

" DAP - Debugging
:DapToggleBreakpoint
:DapContinue
```

### Key Mappings (from configuration)

**File Operations:**
- `Ctrl+p`: Find files (Telescope)
- `<leader>fg`: Live grep search
- `<leader><leader>`: Recent files
- `Ctrl+n`: Toggle Neo-tree file explorer
- `<leader>bf`: Show buffer list in Neo-tree

**LSP Navigation:**
- `K`: Show hover information
- `<leader>gd`: Go to definition
- `<leader>gr`: Go to references  
- `<leader>ca`: Show code actions

**Debugging:**
- `<leader>dt`: Toggle breakpoint
- `<leader>dc`: Start/continue debugging

**Text Manipulation:**
- `<leader>p`: Paste without overwriting register
- `<leader>y`: Copy to system clipboard
- `J/K` (in visual): Move selected lines up/down
- `Ctrl+s` (in insert): Exit insert mode

## Development Setup Requirements

### Prerequisites
1. **Neovim 0.10+**: Required for TreeSitter and modern features
2. **Git**: For plugin management
3. **Node.js/npm**: For some language servers (e.g., pyright)
4. **Python 3**: For Python development and pynvim
5. **Tree-sitter CLI**: For parser compilation

### Language-Specific Setup

**Python:**
- Pyright LSP server (auto-installed via Mason)
- Python virtual environment with debugpy for debugging
- Path configured: `~/.venvs/debugpy/bin/python`

**Lua:**
- lua_ls LSP server (auto-installed via Mason)
- Built-in TreeSitter parser

**Dart/Flutter:**
- Flutter Tools plugin with LSP integration
- Dart language server support
- Widget guides and closing tags enabled

### Debugging Setup
- DAP (Debug Adapter Protocol) configured for Python
- Debugpy integration requires virtual environment setup
- UI automatically opens/closes with debug sessions

## Configuration Patterns

### Plugin Configuration Structure
Each plugin file follows this pattern:
```lua
return {
  "plugin/name",
  dependencies = { "required/deps" },
  config = function()
    -- Plugin setup
  end,
}
```

### LSP Configuration Pattern
- Mason manages server installations
- Individual servers configured in lspconfig setup
- Consistent keymaps applied across all servers
- Completion capabilities integrated with nvim-cmp

### Theme and UI Customization
- Catppuccin color scheme
- Highly customized lualine with fancy separators
- Alpha dashboard with custom ASCII art
- Consistent color theming across components

## File Type Support
- **Python**: Full LSP, debugging, and completion
- **Lua**: LSP with Neovim-specific enhancements
- **Dart/Flutter**: Advanced tooling with widget support
- **General**: TreeSitter parsing for 20+ languages

## Common Troubleshooting

**LSP Issues:**
- Check Mason installations: `:Mason`
- Verify server running: `:LspInfo`
- Restart LSP: `:LspRestart`

**Plugin Issues:**
- Update plugins: `:Lazy update`
- Check plugin status: `:Lazy`
- Clean and reinstall: `:Lazy clean`

**TreeSitter Issues:**
- Update parsers: `:TSUpdate`
- Check parser status: `:TSInstallInfo`

## Performance Notes
- LazyVim enables lazy loading for optimal startup time
- Large files may require TreeSitter optimization
- LSP servers can be resource-intensive for large projects
- Telescope indexing may be slow in very large repositories