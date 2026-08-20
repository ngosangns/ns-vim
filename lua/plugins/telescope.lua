-- Replaces junegunn/fzf(+fzf.vim): fuzzy finder with a native sorter and
-- ignore patterns equivalent to the old (dead) g:ctrlp_custom_ignore.
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules/",
        "%.git/",
        "%.hg/",
        "%.svn/",
        "build/",
        "public/",
        "dist/",
        "%.lock$",
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    pcall(telescope.load_extension, "fzf")
  end,
}
