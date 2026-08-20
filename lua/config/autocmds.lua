-- Session persistence and cursor restore, ported from init.vim.
local session_file = vim.fn.expand("~/.vim/.last.session")

if not vim.g.rc_restore_last_session then
  vim.g.rc_restore_last_session = 0
end

local group = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd("VimLeave", {
  group = group("rc_save_session", { clear = true }),
  callback = function()
    vim.cmd("mksession! " .. vim.fn.fnameescape(session_file))
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = group("rc_restore_session", { clear = true }),
  callback = function()
    if vim.g.rc_restore_last_session == 1 and vim.fn.filereadable(session_file) == 1 then
      vim.cmd("source " .. vim.fn.fnameescape(session_file))
    end
  end,
})

if vim.fn.filereadable(session_file) == 1 then
  vim.keymap.set("n", "<Leader>r", function()
    vim.cmd("source " .. vim.fn.fnameescape(session_file))
  end, { silent = true })
end

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group("rc_last_edit_position", { clear = true }),
  callback = function()
    if vim.bo.filetype:match("commit") then
      return
    end
    local mark = vim.fn.line("'\"")
    if mark >= 1 and mark <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})
