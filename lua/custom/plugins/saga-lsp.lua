-- Saga plugin for symbol reference finds/actions/more
return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
  keys = {
    { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover symbol doc' },
    { 'grr', '<cmd>Lspsaga finder<cr>', desc = 'Find symbol references' },
    { 'gra', '<cmd>Lspsaga code_action<cr>', desc = '[G]oto Code [A]ction' },
    { 'grn', '<cmd>Lspsaga rename<cr>', desc = '[R]e[n]ame' },
  },
  config = function() require('lspsaga').setup {} end,
}
