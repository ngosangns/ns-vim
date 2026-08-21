# ns-vim

Modern Neovim config based on **[LazyVim](https://lazyvim.org)** — designed to feel like
**VS Code / Zed** with all the speed of Vim.

LazyVim provides the full IDE experience out of the box: LSP, completion, telescope,
bufferline, lualine, noice, treesitter, formatting, linting, git integration, and more.
This config adds VS Code-style keymaps and preferences on top.

## What's Included (via LazyVim + custom overrides)

| VS Code / Zed Feature | How it works |
| --- | --- |
| Dark theme (Mocha) | `catppuccin/nvim` (mocha flavour) |
| Tab bar | `akinsho/bufferline.nvim` (slant style) |
| Status bar | `nvim-lualine/lualine.nvim` |
| Symbol outline | Built-in via LazyVim |
| Command palette | `folke/noice.nvim` (floating cmdline) |
| Ctrl+P file finder | `nvim-telescope/telescope.nvim` |
| Ctrl+F search in project | Telescope live_grep |
| Integrated terminal | Snacks.terminal (Ctrl+`) |
| Git blame (GitLens) | `lewis6991/gitsigns.nvim` (inline blame) |
| Git gutter signs | `lewis6991/gitsigns.nvim` |
| Indent guides | `lukas-reineke/indent-blankline.nvim` |
| Bracket auto-close | `windwp/nvim-autopairs` |
| Highlight references | `vim-illuminate` (LazyVim default) |
| TODO highlights | `folke/todo-comments.nvim` |
| Problems panel | `folke/trouble.nvim` |
| Color preview | `norcalli/nvim-colorizer.lua` |
| Smooth scrolling | `karb94/neoscroll.nvim` |
| Notifications (toast) | `rcarriga/nvim-notify` |
| Keybinding hints | `folke/which-key.nvim` |
| Welcome/Start page | `nvimdev/dashboard-nvim` |
| F2 rename | LazyVim inc-rename |
| Move lines Alt+↑/↓ | LazyVim default + custom |
| Duplicate lines | Custom keymaps |
| Format on save | `stevearc/conform.nvim` |
| Linting | `mfussenegger/nvim-lint` |
| LSP + completion | `nvim-lspconfig` + `blink.cmp` |
| Snippets | `rafamadriz/friendly-snippets` |
| Flash/Jump motions | `folke/flash.nvim` |
| Surround | `echasnovski/mini.surround` |

## Requirements

- **Neovim >= 0.11**
- `git`, a C compiler and `curl`/`tar` in `PATH` (Treesitter parser builds)
- A [Nerd Font](https://www.nerdfonts.com/) patched font in your terminal
- `ripgrep` (for Telescope live_grep)
- Optional formatter/linter binaries on `PATH`:
  `stylua`, `goimports`, `prettierd`/`prettier`, `eslint_d`

## Setup

```sh
# Remove old config
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim

# Clone this config
git clone https://github.com/ngosangns/ngosangns-vim-configure ~/.config/nvim
```

Open `nvim`. lazy.nvim bootstraps itself, installs LazyVim + all plugins on first launch.
LSP servers install automatically via Mason.

## Key Mappings (VS Code style)

LazyVim provides extensive default keymaps (press `<Space>` to see which-key menu).
These VS Code overrides are added on top:

### General
| Shortcut | Action |
| --- | --- |
| `Ctrl+S` | Save |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Ctrl+A` | Select all |
| `Ctrl+C` | Copy (line / selection) |
| `Ctrl+X` | Cut (line / selection) |

### Navigation, LSP & Panels
| Shortcut | Action |
| --- | --- |
| `Ctrl+P` | Find files |
| `Ctrl+F` | Find in the current buffer |
| `Alt+F` | Search in project |
| `Alt+P` | Command palette |
| `Ctrl+R` | Show document symbols |
| `Ctrl+`` ` | Toggle integrated terminal |
| `Alt+Left/Right` | Switch buffer tab |
| `Ctrl+N` | New buffer |
| `Ctrl+W` | Close buffer |
| `F2` | Rename symbol |
| `F8` | Show diagnostics / Problems |
| `F12` | Go to definition |
| `Shift+F12` | Find references |

Terminal applications may not distinguish `Ctrl+Shift` letter chords consistently. `Alt+P` and `Alt+F` are portable alternatives for the VS Code command palette and project search.

### Editing
| Shortcut | Action |
| --- | --- |
| `Alt+Up/Down` | Move line(s) up/down (LazyVim default) |
| `Shift+Alt+Up/Down` | Duplicate line(s) |
| `Tab` (visual) | Indent |
| `Shift+Tab` | Unindent |
| `<leader>cf` | Format buffer |

### LazyVim Leader Key (`Space`)
| Shortcut | Action |
| --- | --- |
| `Space` | Which-key menu (all commands) |
| `Space f` | Find/File menu |
| `Space g` | Git menu |
| `Space l` | LSP menu |
| `Space x` | Diagnostics/Trouble |
| `Space s` | Search menu |

## File Structure

```
init.lua                  -- Entry point (just loads config.lazy)
lua/
├── config/
│   ├── lazy.lua          -- lazy.nvim bootstrap + LazyVim import
│   ├── options.lua       -- Custom options (tabs, scroll, etc.)
│   ├── keymaps.lua       -- VS Code-style keymaps
│   └── autocmds.lua      -- Custom autocmds
└── plugins/
    ├── colorscheme.lua   -- Catppuccin Mocha theme
    ├── editor.lua        -- Colorizer, neoscroll, autopairs
    ├── lang.lua          -- Language extras (TS, Go, etc.)
    └── ui.lua            -- Git blame, bufferline style, dashboard
```

## Screenshots

![](./screenshots/1.png)
![](./screenshots/2.png)
![](./screenshots/3.png)
