-- Keymaps. Ported 1:1 from the old MapBoth()-based mappings in init.vim.
-- MapBoth used recursive `map` (not `noremap`) across n/i/v/c/t, with an
-- <Esc><Esc> prefix in insert/visual/cmdline and <LeftMouse> in terminal
-- mode; that's replicated here via vim.keymap.set(..., { remap = true }).
local function map_both(keys, rhs)
  local opts = { remap = true, silent = true }
  vim.keymap.set("n", keys, rhs, opts)
  vim.keymap.set("i", keys, "<Esc><Esc>" .. rhs, opts)
  vim.keymap.set("v", keys, "<Esc><Esc>" .. rhs, opts)
  vim.keymap.set("c", keys, "<Esc><Esc>" .. rhs, { remap = true })
  vim.keymap.set("t", keys, "<LeftMouse>" .. rhs, opts)
end

-- Undo / redo
map_both("<C-z>", ":undo<CR>")
map_both("<C-y>", ":redo<CR>")
-- Tabs
map_both("<A-Left>", ":tabprev<CR>")
map_both("<A-Right>", ":tabnext<CR>")
map_both("<C-n>", ":tabnew<CR>")
-- Window navigation
map_both("<C-S-Up>", ":wincmd k<CR>")
map_both("<C-S-Down>", ":wincmd j<CR>")
map_both("<C-S-Left>", ":wincmd h<CR>")
map_both("<C-S-Right>", ":wincmd l<CR>")
-- Search
map_both("<C-f>", "/")
-- New line
map_both("<A-CR>", "o")
-- Close window/tab
map_both("<C-w>", ":q!<CR>")
-- Fast jump
map_both("<C-Up>", "5k")
map_both("<C-Down>", "5j")
map_both("<C-Left>", "10h")
map_both("<C-Right>", "10l")
-- Command mode
map_both("<C-\\>", "<Esc><Esc>:")
vim.keymap.set("i", "<C-.>", "<C-o>", { remap = true })
-- Copy / cut / paste
map_both("<C-c>", "yy")
vim.keymap.set("v", "<C-c>", "ygv", { remap = true })
map_both("<C-x>", "dd")
vim.keymap.set("v", "<C-x>", "d", { remap = true })
map_both("<C-v>", "P")
vim.keymap.set("v", "<C-v>", "gp", { remap = true })
-- Select all
map_both("<C-a>", "ggVG$")
-- Save
map_both("<C-s>", ":w<CR>")
-- Backspace / enter / tab (effective behaviour of the original file, where
-- the later `nmap <BS> i<BS>` overrode the earlier nohlsearch mapping)
vim.keymap.set("v", "<BS>", '"_d', { remap = true })
vim.keymap.set("n", "<BS>", "i<BS>", { remap = true })
vim.keymap.set("n", "<CR>", "i<CR>", { remap = true })
vim.keymap.set("n", "<Tab>", "i<Tab>", { remap = true })
vim.keymap.set("v", "<Tab>", ">gv", { remap = true })
map_both("<S-Tab>", "<<")
vim.keymap.set("v", "<S-Tab>", "<gv", { remap = true })

-- LSP
map_both("<F12>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { silent = true, desc = "Format selection/buffer" })
-- Outline
map_both("<C-r>", ":AerialToggle<CR>")
-- Comment (native Neovim gc/gcc, no plugin needed)
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, silent = true })
-- Fuzzy find files
map_both("<C-p>", ":Telescope find_files<CR>")
-- Exit vim
map_both("<C-d>", ":qa!<CR>")
-- File explorer
map_both("<C-b>", ":NvimTreeToggle<CR>")

-- Move out of a visual selection with arrow keys
vim.keymap.set("v", "<Left>", "<Esc>`<<Left>")
vim.keymap.set("v", "<Up>", "<Esc>`<<Up>")
vim.keymap.set("v", "<Right>", "<Esc>`><Right>")
vim.keymap.set("v", "<Down>", "<Esc>`><Down>")

-- Visually select the text that was last edited/pasted
vim.keymap.set("n", "gV", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })
