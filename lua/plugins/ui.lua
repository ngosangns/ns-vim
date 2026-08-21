-- UI tweaks on top of LazyVim defaults.
-- LazyVim already includes: bufferline, lualine, noice, nvim-notify,
-- which-key, dashboard, indent-blankline, mini.icons, nvim-web-devicons.
return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },

  -- Gitsigns: enable inline blame (VS Code GitLens-style)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    },
  },

  -- Bufferline: slant separator style (more VS Code-like)
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slant",
        show_close_icon = false,
      },
    },
  },

  -- Lualine: catppuccin theme
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },

  -- Dashboard header override
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
 ███╗   ██╗███████╗      ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝      ██║   ██║██║████╗ ████║
 ██╔██╗ ██║███████╗█████╗██║   ██║██║██╔████╔██║
 ██║╚██╗██║╚════██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████║       ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝        ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
      logo = string.rep("\n", 4) .. logo .. "\n\n"
      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
