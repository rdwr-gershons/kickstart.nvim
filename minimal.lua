vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.autoindent = true
    vim.opt.smartindent = true
    vim.opt.indentexpr = nil
  end,
})
-- Minimal Syntax Highlighting
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
