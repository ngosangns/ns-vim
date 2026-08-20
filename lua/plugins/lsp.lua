-- Replaces neoclide/coc.nvim entirely with native Neovim LSP.
-- Server <-> old coc extension mapping:
--   coc-html      -> html
--   coc-css       -> cssls
--   coc-json      -> jsonls
--   coc-tsserver  -> ts_ls
--   coc-go        -> gopls
--   coc-sourcekit -> sourcekit (ships with Xcode on macOS, not via Mason)
-- lua_ls is added since this config itself is now Lua.
return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "gopls", "ts_ls", "html", "cssls", "jsonls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = { gofumpt = false, staticcheck = true },
        },
      })

      -- sourcekit-lsp ships with the Xcode toolchain, not installable via Mason.
      if vim.fn.executable("sourcekit-lsp") == 1 then
        vim.lsp.config("sourcekit", {})
        vim.lsp.enable("sourcekit")
      end

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        severity_sort = true,
      })
    end,
  },
}
