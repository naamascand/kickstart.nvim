-- Auto-reload files changed on disk (e.g. by an AI agent or another tool),
-- as long as the buffer has no unsaved local edits.

vim.o.autoread = true

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'TermLeave' }, {
  desc = 'Check for external file changes',
  callback = function()
    if vim.bo.buftype == '' and vim.fn.getcmdwintype() == '' then vim.cmd 'checktime' end
  end,
})

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  desc = 'Notify when a file is reloaded after external changes',
  callback = function(event)
    vim.notify('Reloaded from disk: ' .. vim.fn.fnamemodify(event.file, ':.'), vim.log.levels.INFO)
  end,
})
