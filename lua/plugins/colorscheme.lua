-- Replaces joshdick/onedark.vim (Vimscript) with the actively maintained
-- Lua rewrite: same look, native treesitter/LSP highlight groups.
return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "dark",
    transparent = false,
    term_colors = true,
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
