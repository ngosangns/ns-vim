-- Colorscheme: Catppuccin Mocha (closest to VS Code Dark+ / Zed)
return {
  -- Set catppuccin as the LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      integrations = {
        aerial = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        indent_blankline = { enabled = true, scope_color = "lavender" },
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        noice = true,
        notify = true,
        nvim_surround = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
    },
  },
}
