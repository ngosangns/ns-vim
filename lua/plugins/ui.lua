-- Icons + statusline + file explorer + symbol outline.
-- Replaces: ryanoasis/vim-devicons (archived, dropped) +
-- kyazdani42/nvim-web-devicons (repo renamed) -> nvim-tree/nvim-web-devicons
-- itchyny/lightline.vim + maximbaz/lightline-ale -> lualine.nvim
-- coc-explorer -> nvim-tree.lua
-- vista.vim / CocList outline (never actually installed) -> aerial.nvim
return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "onedark",
        globalstatus = true,
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 34 },
      renderer = { group_empty = true, icons = { git_placement = "before" } },
      filters = { dotfiles = false },
      git = { enable = true },
    },
  },
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = { min_width = 30 },
    },
  },
}
