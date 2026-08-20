-- Syntax highlighting/indent via Treesitter, covering the same languages
-- the old coc extensions targeted (html/css/json/ts/go) plus this config's
-- own Lua files. Pinned to the `master` branch: the new `main` branch is a
-- from-scratch rewrite that requires Neovim 0.12 nightly.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "query", "bash",
      "go", "gomod", "gowork", "gosum",
      "javascript", "typescript", "tsx",
      "html", "css", "json", "yaml",
      "markdown", "markdown_inline",
      "swift",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
