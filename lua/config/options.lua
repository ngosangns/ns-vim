-- Core options. Ported 1:1 from the old init.vim where still relevant;
-- options removed by newer Neovim (e.g. 'ttyfast') or superseded by plugins
-- (manual statusline -> lualine, vista vars -> aerial) are dropped.
local opt = vim.opt

-- Look & feel
vim.cmd.syntax("on")
vim.cmd.filetype("plugin", "indent", "on")
opt.termguicolors = true
opt.number = true
opt.cursorline = true
opt.showtabline = 2
opt.laststatus = 3 -- single global statusline (lualine)
opt.signcolumn = "yes"
opt.wrap = false
opt.foldlevel = 100 -- unfold all by default
opt.list = true
opt.listchars = { tab = "¦ ", eol = "¬", trail = "⋅", extends = "»", precedes = "«" }
opt.mousehide = true
opt.ruler = true

-- Editing
opt.mouse = "a"
opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.keymodel = { "startsel", "stopsel" }
opt.backspace = { "eol", "start", "indent" }
opt.formatoptions:append("B")
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.virtualedit = "block,onemore"
opt.splitright = true
opt.splitbelow = true

-- Backup / swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false
local swapdir = vim.fn.expand("$HOME/.vim/swapfiles")
if vim.fn.isdirectory(swapdir) == 0 then
  vim.fn.mkdir(swapdir, "p")
end
opt.directory = swapdir .. "//"

-- Search
opt.magic = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI behaviour
opt.updatetime = 200
opt.cmdheight = 1
opt.shortmess:append("c")
opt.lazyredraw = true
opt.errorbells = false
opt.visualbell = false
vim.cmd("set t_vb=")
opt.wildmenu = true
opt.wildmode = { "list:longest", "full" }
opt.wildignore = { "*.so", "*.swp", "*.pyc", "*.pyo", "*.exe", "*.7z" }
if vim.fn.has("win32") == 1 then
  opt.wildignore:append({ ".git\\*", ".hg\\*", ".svn\\*", "*\\desktop.ini" })
else
  opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" })
end
opt.sessionoptions:remove("options")
opt.autoread = true
opt.history = 1000
opt.hidden = true
