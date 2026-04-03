-- Tabs plugin, allows to arrange files/buffers
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  keys = {
    { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = 'Previous buffer' },
    { '<A-.>', '<Cmd>BufferNext<CR>', desc = 'Next buffer' },
    { '<A-x>', '<Cmd>BufferClose<CR>', desc = 'Close current tab' },
    { '<A-s>', '<cmd>BufferOrderByLanguage<CR>', desc = 'Order tabs by language' },
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --animation = true,
    insert_at_start = true,
    -- …etc.
  },
  config = function(_, opts)
    require('barbar').setup(opts) -- Manually call setup
  end,
  -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
