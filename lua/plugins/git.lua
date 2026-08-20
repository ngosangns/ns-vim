-- tpope/vim-fugitive is still best-in-class and actively maintained: kept.
-- airblade/vim-gitgutter -> lewis6991/gitsigns.nvim (Lua, faster, richer).
return {
  { "tpope/vim-fugitive", cmd = { "Git", "Gdiffsplit", "Gvdiffsplit" } },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
