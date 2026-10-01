# Neovim Configuration Overview

This is a modular Neovim configuration using **lazy.nvim** for plugin management and Neovim's built-in **LSP configuration API**.

The configuration is organized around a simple principle: keep general Neovim behavior in `lua/config/`, plugin configuration in `lua/plugins/`, and language-server-specific settings in `lsp/`.

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── overview.md
├── .stylua.toml
├── lsp/
│   └── lua_ls.lua
└── lua/
    ├── config/
    │   ├── autocmds.lua
    │   ├── lazy.lua
    │   ├── mappings.lua
    │   └── settings.lua
    └── plugins/
        ├── cmp.lua
        ├── colors.lua
        ├── comment.lua
        ├── conform.lua
        ├── fugitive.lua
        ├── gitsigns.lua
        ├── harpoon.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── minipairs.lua
        ├── neo-tree.lua
        ├── oil.lua
        ├── render-markdown.lua
        ├── telescope.lua
        ├── treesitter.lua
        ├── undotree.lua
        └── vim-tmux-navigator.lua
```

---

## Startup

`init.lua` is the entry point for the configuration:

```lua
require("config.settings")
require("config.autocmds")
require("config.lazy")
require("config.mappings")
```

The files are loaded in this order:

1. General Neovim settings
2. Autocommands
3. lazy.nvim and plugins
4. General keymaps

Keeping `init.lua` small makes it easy to see the overall structure without having to read the individual configuration files.

---

# `lua/config/`

This directory contains configuration that applies to Neovim itself rather than to a particular plugin.

## `settings.lua`

Contains general editor settings, including:

* Leader keys
* Line numbers and relative line numbers
* Cursor and scrolling behavior
* Sign column
* Indentation
* Search behavior
* Splitting behavior
* Undo persistence
* Command preview
* Color column

The default indentation settings are four spaces with spaces instead of tabs.

The default color column is 80 characters, with Python and Lua using 100 characters and Oil disabling the color column.

```text
Default   → 80
Lua       → 100
Python    → 100
Oil       → disabled
```

---

## `mappings.lua`

Contains general-purpose keymaps that are not tied to a particular plugin.

Some notable mappings:

| Key                 | Action                                      |
| ------------------- | ------------------------------------------- |
| `jj`                | Leave Insert mode                           |
| `<Esc>`             | Clear search highlighting                   |
| `n` / `N`           | Search next/previous and center the result  |
| `<leader><leader>x` | Save and source the current file            |
| `<leader>s`         | Find and replace the word under the cursor  |
| `<leader>y`         | Yank to the system clipboard                |
| `<leader>P`         | Paste from the system clipboard             |
| `<leader>p`         | Paste without overwriting the yank register |
| `<A-j>` / `<A-k>`   | Move selected lines down/up                 |

Window navigation is provided by `vim-tmux-navigator` rather than by custom `<C-h/j/k/l>` mappings.

---

## `autocmds.lua`

Contains event-driven behavior.

### Cursorline

The cursorline is enabled for the active window and disabled for inactive windows.

Its background changes between Normal and Insert mode.

### Yank highlighting

Yanked text is briefly highlighted using `vim.hl.on_yank()`.

### LSP attachment

The `LspAttach` autocommand sets up buffer-local LSP functionality.

The following LSP mappings are available:

| Key          | Action                |
| ------------ | --------------------- |
| `gd`         | Go to definition      |
| `gr`         | Find references       |
| `gI`         | Go to implementation  |
| `gD`         | Go to declaration     |
| `<leader>D`  | Go to type definition |
| `<leader>ds` | Document symbols      |
| `<leader>ws` | Workspace symbols     |
| `<leader>rn` | Rename                |
| `<leader>ca` | Code action           |
| `K`          | Hover documentation   |
| `<leader>e`  | Show diagnostic       |
| `<leader>th` | Toggle inlay hints    |

Telescope is used for several LSP navigation and symbol actions.

When supported by the language server, references to the symbol under the cursor are also highlighted while the cursor is held over it.

---

# `lua/config/lazy.lua`

Bootstraps **lazy.nvim** and loads all plugin specifications from `lua/plugins/`.

Plugins are automatically discovered through:

```lua
{ import = "plugins" }
```

The configuration currently disables:

* Automatic plugin update checking
* Automatic change detection

Plugin versions are pinned in `lazy-lock.json`.

---

# `lua/plugins/`

Each file in this directory contains the lazy.nvim specification for one plugin or one closely related group of plugins.

The plugin specifications use lazy.nvim's normal mechanisms such as:

* `event` — when a plugin is loaded
* `keys` — keymaps that load/use a plugin
* `dependencies` — required plugins
* `opts` — plugin configuration
* `config` — custom setup code
* `branch` / `version` — version selection

The configuration is intentionally split by responsibility rather than putting all plugins into one large file.

---

# Editing and navigation

## Telescope

`lua/plugins/telescope.lua`

**Telescope** provides fuzzy finding and search.

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>ff` | Find files                  |
| `<leader>fg` | Live grep                   |
| `<leader>fb` | Find open buffers           |
| `<leader>fh` | Search help                 |
| `<leader>fk` | Search keymaps              |
| `<leader>fd` | Buffer diagnostics          |
| `<leader>fD` | Workspace diagnostics       |
| `<leader>/`  | Fuzzy search current buffer |

Telescope also provides the UI for several LSP operations.

The FZF native extension is enabled when `make` is available.

---

## Harpoon

`lua/plugins/harpoon.lua`

**Harpoon** provides quick access to frequently used files.

| Key         | Action               |
| ----------- | -------------------- |
| `<leader>a` | Add current file     |
| `<C-e>`     | Show Harpoon entries |
| `<A-h>`     | Jump to entry 1      |
| `<A-j>`     | Jump to entry 2      |
| `<A-k>`     | Jump to entry 3      |
| `<A-l>`     | Jump to entry 4      |

---

## Oil

`lua/plugins/oil.lua`

**Oil** provides a file-system editor.

`<leader>o` toggles the Oil floating window.

Hidden files are shown in Oil, and the floating window displays modification time and icons.

---

## Neo-tree

`lua/plugins/neo-tree.lua`

**Neo-tree** provides a traditional file explorer.

| Key         | Action          |
| ----------- | --------------- |
| `<leader>-` | Toggle Neo-tree |
| `-`         | Focus Neo-tree  |

The explorer opens on the right with a width of 25 columns.

Dotfiles and Git-ignored files are hidden.

---

## tmux navigation

`lua/plugins/vim-tmux-navigator.lua`

`vim-tmux-navigator` makes the same keybindings work for navigating both Neovim splits and tmux panes.

| Key     | Action                    |
| ------- | ------------------------- |
| `<C-h>` | Navigate left             |
| `<C-j>` | Navigate down             |
| `<C-k>` | Navigate up               |
| `<C-l>` | Navigate right            |
| `<C-\>` | Navigate to previous pane |

---

## UndoTree

`lua/plugins/undotree.lua`

`<leader>u` toggles the UndoTree interface.

Undo persistence is enabled in `settings.lua`, so undo history survives between editing sessions.

---

# LSP, completion, linting and formatting

The coding-language configuration is divided into four pieces:

```text
lsp.lua
  │
  ├── installs/enables language servers
  │
  └── provides shared LSP capabilities
             │
             ├── basedpyright
             ├── ruff
             ├── lua_ls
             └── bashls

lsp/
  └── server-specific settings

cmp.lua
  └── completion and snippets

conform.lua
  └── formatting
```

The important distinction is that **LSP, completion, formatting, and linting are separate systems** even though they work together to provide the editing experience.

---

## `lua/plugins/lsp.lua`

This file configures the LSP infrastructure.

### Mason

**Mason** installs and manages external language servers and development tools.

The currently requested language servers are:

| Server         | Language / purpose   |
| -------------- | -------------------- |
| `lua_ls`       | Lua                  |
| `bashls`       | Bash                 |
| `basedpyright` | Python type checking |
| `ruff`         | Python linting       |

The currently requested external tools are:

| Tool     | Purpose                          |
| -------- | -------------------------------- |
| `stylua` | Lua formatting                   |
| `ruff`   | Python linting/fixing/formatting |
| `shfmt`  | Shell formatting                 |

### Shared capabilities

`cmp-nvim-lsp` supplies completion capabilities to the language servers:

```lua
local capabilities = require("cmp_nvim_lsp").default_capabilities()
```

Those capabilities are then applied to each configured language server.

### Neovim 0.11 LSP configuration

This configuration uses the Neovim 0.11 API:

```lua
vim.lsp.config(...)
```

rather than the older:

```lua
require("lspconfig").<server>.setup(...)
```

The `lspconfig` plugin supplies server-specific default configurations, while Neovim's built-in LSP API handles merging and activating those configurations.

---

## `lsp/`

The `lsp/` directory contains server-specific LSP configuration.

A file such as:

```text
lsp/lua_ls.lua
```

is associated with the LSP configuration named `lua_ls`.

Neovim 0.11 automatically discovers `lsp/<config-name>.lua` files on the runtime path and merges them into the corresponding LSP configuration.

This means the main LSP setup does not need to contain every server's settings.

For example, `lsp/lua_ls.lua` currently contains:

```lua
return {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
```

Only language servers that require additional local settings need a file here.

Project-specific language-server settings should generally live in the project's configuration file where supported. For example, basedpyright settings can live in `pyproject.toml`.

---

# Completion

## `lua/plugins/cmp.lua`

**nvim-cmp** is the completion engine.

It combines completion sources from:

* LSP
* LuaSnip
* File paths
* The current buffer

**LuaSnip** provides snippet expansion and navigation.

Important completion mappings:

| Key               | Action                          |
| ----------------- | ------------------------------- |
| `<C-n>`           | Next completion                 |
| `<C-p>`           | Previous completion             |
| `<C-y>`           | Accept completion               |
| `<C-Space>`       | Trigger completion              |
| `<C-b>` / `<C-f>` | Scroll completion documentation |
| `<C-l>`           | Expand/jump forward in snippet  |
| `<C-h>`           | Jump backward in snippet        |

---

# Formatting

## `lua/plugins/conform.lua`

**Conform.nvim** handles formatting.

Formatting happens automatically before saving.

`<leader>=` formats the current buffer manually.

Current formatters:

| Filetype | Formatter |
| -------- | --------- |
| Lua      | StyLua    |
| Python   | Ruff      |
| Bash     | shfmt     |
| Shell    | shfmt     |

Python uses:

```text
ruff_fix → ruff_format
```

so Ruff is responsible for both fixing/linting and formatting.

C and C++ deliberately disable LSP fallback formatting.

---

## `.stylua.toml`

`.stylua.toml` configures StyLua independently of Neovim.

Current settings include:

* 100-column width
* Spaces
* Four-space indentation
* Unix line endings
* Double quotes when appropriate
* Parentheses always used for function calls
* LuaJIT syntax

The distinction is:

```text
Conform
  └── decides when StyLua runs

.stylua.toml
  └── decides how StyLua formats Lua
```

Similarly, project-specific Ruff configuration should normally live in the project's `pyproject.toml` or `ruff.toml`, rather than in the Neovim LSP configuration.

---

# Python

Python uses two separate language tools:

### basedpyright

`basedpyright` provides:

* Type checking
* Diagnostics
* Go-to-definition
* References
* Hover information
* Rename
* Code actions
* Other LSP functionality

### Ruff

Ruff provides:

* Linting
* Automatic fixes
* Formatting

The responsibilities are therefore roughly:

```text
Python
  │
  ├── basedpyright
  │     └── type checking / LSP
  │
  └── Ruff
        ├── linting
        ├── fixes
        └── formatting
```

Project-specific basedpyright configuration should normally be kept in the project's `pyproject.toml`:

```toml
[tool.basedpyright]
typeCheckingMode = "standard"
```

This keeps project behavior independent of the editor.

---

# Treesitter

## `lua/plugins/treesitter.lua`

**nvim-treesitter** provides syntax-aware parsing.

The configuration installs parsers for:

* Bash
* C
* Lua
* Python
* Query
* Vim
* Vimdoc

Syntax highlighting and indentation are enabled.

For files larger than 100 KB, Treesitter highlighting is disabled to avoid potentially expensive processing.

---

# Appearance

## Catppuccin

`lua/plugins/colors.lua`

The **Catppuccin** theme is configured with the Mocha flavour.

Several UI elements receive custom backgrounds, including:

* Normal windows
* Inactive windows
* Floating windows
* Neo-tree
* Cursorline
* Color column

---

## Lualine

`lua/plugins/lualine.lua`

The statusline displays:

* Current mode
* Git branch
* Git diff
* Diagnostics
* Filename
* Encoding
* File format
* Filetype
* Progress
* Cursor location

The theme integrates with Catppuccin.

---

# Git

Git functionality comes from two plugins.

## Gitsigns

`lua/plugins/gitsigns.lua`

Gitsigns displays changes in the sign column.

The configured signs indicate:

* Added lines
* Changed lines
* Deleted lines

Delete/change signs also display counts where configured.

## Fugitive

`lua/plugins/fugitive.lua`

`<leader>gs` opens the Fugitive Git interface.

---

# Other plugins

## Comment.nvim

`lua/plugins/comment.lua`

Provides comment toggling with the standard `gc` mappings.

---

## mini.pairs

`lua/plugins/minipairs.lua`

Provides automatic insertion of matching pairs such as parentheses, brackets, and quotes.

---

## render-markdown

`lua/plugins/render-markdown.lua`

Enhances the appearance of Markdown buffers using Treesitter and icons.

It is loaded only for Markdown files.

---

# Plugin lockfile

`lazy-lock.json` records the exact Git commit currently selected for each plugin.

This makes the plugin set reproducible rather than allowing every startup to use whatever happens to be the latest version.

When plugins are updated, `lazy-lock.json` changes accordingly.

---

# Configuration philosophy

The configuration intentionally separates responsibilities:

```text
init.lua
    │
    ├── config/settings.lua
    │       General Neovim behavior
    │
    ├── config/autocmds.lua
    │       Event-driven behavior
    │
    ├── config/lazy.lua
    │       Plugin manager
    │
    └── config/mappings.lua
            General keymaps

lua/plugins/
    │
    ├── Editor plugins
    ├── Navigation
    ├── Appearance
    ├── Git
    ├── Completion
    ├── Formatting
    └── LSP infrastructure

lsp/
    │
    └── Server-specific LSP settings

Project configuration
    │
    ├── pyproject.toml
    └── .stylua.toml
```

The goal is that:

* **General editor behavior** lives in `lua/config/`.
* **Plugin behavior** lives next to the plugin in `lua/plugins/`.
* **LSP-specific editor configuration** lives in `lsp/`.
* **Project/tool configuration** lives with the project.
* **Plugin versions** are recorded in `lazy-lock.json`.

This keeps Neovim-specific configuration separate from language/tool configuration and makes individual pieces easier to find and change.
