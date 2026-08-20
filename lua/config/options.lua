-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- VS Code / Zed preferences
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.confirm = true
opt.virtualedit = "block,onemore"
opt.listchars = { tab = "  ", trail = "·", extends = "»", precedes = "«" }
