-- fold/unfold code blocks in different languages
return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  event = 'VeryLazy', -- Load early to handle initial folds
  init = function()
    -- Option: Disable foldcolumn for a cleaner look, or set to 1
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99 -- High level to open all folds by default
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    -- Modern fold icons
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:]]
  end,
  config = function()
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' } -- Uses LSP for folding, falls back to indent
      end,
    }
  end,
}
