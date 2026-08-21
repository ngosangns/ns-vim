-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- VS Code-style shortcuts (on top of LazyVim's defaults which already include
-- bufferline, telescope, terminal, etc.)

-- Save (Ctrl+S) — LazyVim already maps this
-- Undo/Redo (Ctrl+Z/Y)
map({ "n", "i", "v" }, "<C-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd>redo<cr>", { desc = "Redo" })

-- Select all (Ctrl+A)
map({ "n", "i", "v" }, "<C-a>", "<esc>ggVG", { desc = "Select all" })

-- Copy/Cut/Paste (Ctrl+C/X/V)
map("n", "<C-c>", "yy", { desc = "Copy line" })
map("v", "<C-c>", "ygv", { desc = "Copy selection" })
map("n", "<C-x>", "dd", { desc = "Cut line" })
map("v", "<C-x>", "d", { desc = "Cut selection" })

-- Duplicate line (Shift+Alt+Down/Up) — VS Code style
map("n", "<S-A-Down>", ":t.<CR>", { silent = true, desc = "Duplicate line down" })
map("n", "<S-A-Up>", ":t.-1<CR>", { silent = true, desc = "Duplicate line up" })
map("v", "<S-A-Down>", ":t'>.<CR>gv", { silent = true, desc = "Duplicate selection down" })
map("v", "<S-A-Up>", ":t'<.-1<CR>gv", { silent = true, desc = "Duplicate selection up" })

-- Find files (Ctrl+P)
map("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find files" })

-- Find in the current buffer (Ctrl+F) and search the project (Alt+F)
map("n", "<C-f>", "/", { desc = "Find in buffer" })
map("n", "<A-f>", function()
  Snacks.picker.grep()
end, { desc = "Search in project" })

-- Command palette (Alt+P)
map("n", "<A-p>", function()
  Snacks.picker.commands()
end, { desc = "Command palette" })

-- Toggle terminal (Ctrl+`) — LazyVim uses <C-/> and <C-_>, add Ctrl+` too
map("n", "<C-`>", function()
  Snacks.terminal()
end, { desc = "Toggle terminal" })
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Close terminal" })

-- Comment (Ctrl+/) — LazyVim already maps this via mini.comment or ts-context-commentstring

-- Close buffer (Ctrl+W) — override default window close
map("n", "<C-w>", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })

-- New buffer (Ctrl+N)
map("n", "<C-n>", "<cmd>enew<cr>", { desc = "New buffer" })

-- Buffer tabs navigation (Alt+Left/Right)
map("n", "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<A-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Fast scroll
map({ "n", "v" }, "<C-Up>", "5k", { desc = "Fast up" })
map({ "n", "v" }, "<C-Down>", "5j", { desc = "Fast down" })

-- LSP navigation and diagnostics
map("n", "<C-r>", function()
  Snacks.picker.lsp_symbols()
end, { desc = "Document symbols" })
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<F8>", function()
  Snacks.picker.diagnostics()
end, { desc = "Show problems" })
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<S-F12>", vim.lsp.buf.references, { desc = "Find references" })

-- Tab/Shift+Tab indent in visual mode
map("v", "<Tab>", ">gv", { desc = "Indent" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent" })
