-- Extra editor plugins on top of what LazyVim already provides.
-- LazyVim already includes: flash.nvim, mini.pairs, mini.surround,
-- mini.ai, ts-comments, todo-comments, trouble, which-key, etc.
return {
  -- Color highlighter (VS Code shows CSS colors inline)
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = { "css", "scss", "html", "javascript", "typescript", "lua", "vue", "svelte" },
      user_default_options = {
        css = true,
        tailwind = true,
        mode = "background",
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts.filetypes, opts.user_default_options)
    end,
  },

  -- Smooth scrolling (Zed-like)
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      hide_cursor = false,
      easing = "quadratic",
    },
  },

  -- Auto-pairs: use nvim-autopairs instead of mini.pairs for more VS Code-like behavior
  {
    "echasnovski/mini.pairs",
    enabled = false, -- disable LazyVim's default
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      fast_wrap = { map = "<M-e>" },
    },
  },
}
