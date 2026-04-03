return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'neovim/nvim-lspconfig',
  },
  config = function() require('gopher').setup() end,
}
