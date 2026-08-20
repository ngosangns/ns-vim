# ngosangns-vim-configure

Modern Neovim config: [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager, native LSP
(`nvim-lspconfig` + `mason.nvim`), Treesitter, Telescope. No Vimscript plugin manager, no
`coc.nvim` — everything is Lua under `lua/`.

## Plugins

| Purpose | Plugin |
| --- | --- |
| Colorscheme | `navarasu/onedark.nvim` |
| Statusline | `nvim-lualine/lualine.nvim` |
| Icons | `nvim-tree/nvim-web-devicons` |
| File explorer | `nvim-tree/nvim-tree.lua` |
| Symbol outline | `stevearc/aerial.nvim` |
| Fuzzy finder | `nvim-telescope/telescope.nvim` (+ `telescope-fzf-native.nvim`) |
| Git blame/diff/commit | `tpope/vim-fugitive` |
| Git gutter signs | `lewis6991/gitsigns.nvim` |
| Surround text objects | `kylechui/nvim-surround` |
| Commenting | native Neovim `gc`/`gcc` (0.10+, no plugin) |
| Syntax/indent | `nvim-treesitter/nvim-treesitter` (`master` branch) |
| LSP | `neovim/nvim-lspconfig` + `mason.nvim` + `mason-lspconfig.nvim` |
| Completion | `saghen/blink.cmp` |
| Formatting | `stevearc/conform.nvim` |
| Linting | `mfussenegger/nvim-lint` |

## Requirements

- **Neovim >= 0.11** (uses `vim.lsp.config`/`vim.lsp.enable`)
- `git`, a C compiler and `curl`/`tar` in `PATH` (Treesitter parser builds)
- A [Nerd Font](https://www.nerdfonts.com/) patched font in your terminal
- Optional formatter/linter binaries on `PATH` for the languages you use:
  `stylua`, `goimports`, `prettierd`/`prettier`, `eslint_d`
- macOS + Xcode toolchain if you want Swift LSP (`sourcekit-lsp`, detected automatically)

## Setup

```sh
# Remove old config
rm -rf ~/.config/nvim
# Clone this config
git clone https://github.com/ngosangns/ngosangns-vim-configure ~/.config/nvim
```

Open `nvim`. `lazy.nvim` bootstraps itself and installs every plugin on first launch.
LSP servers listed in `lua/plugins/lsp.lua` (`ensure_installed`) install automatically via Mason;
run `:Mason` to manage servers manually, `:LspInstall <server>` to add more.

Enjoy!

## Key mappings (all modes unless noted)

Exit vim: `Ctrl + d`

Text behavior:
- Copy: `Ctrl + c`
- Paste: `Ctrl + v`
- New line: `Alt + Enter`
- Cut: `Ctrl + x`
- Format buffer/selection: `\ + f`
- Undo: `Ctrl + z`
- Redo: `Ctrl + y`
- Select all: `Ctrl + a`
- Comment line/selection: `Ctrl + /`

Navigation:
- Fast move: `Ctrl + Arrow`
- Switch tab: `Alt + Left|Right`
- Close tab/window: `Ctrl + w`
- New tab: `Ctrl + n`
- Go to command mode: `Ctrl + \`
- Go to definition: `F12`

File explorer (`nvim-tree`):
- Toggle: `Ctrl + b`

File contents:
- Toggle symbol outline: `Ctrl + r`
- Find files: `Ctrl + p`
- Search text: `Ctrl + f`
- Save file: `Ctrl + s`

## Managing LSP servers

```
:Mason           " browse/install/remove servers, formatters, linters
:LspInstall <name>
:checkhealth lsp
```

## Screenshots

![](./screenshots/1.png)
![](./screenshots/2.png)
![](./screenshots/3.png)
