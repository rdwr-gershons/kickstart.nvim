return {
  -- Snippet Collection (friendly-snippets includes C++ snippets)
  --{ 'rafamadriz/friendly-snippets' },
  -- Autocompletion Plugin
  --{
  --'hrsh7th/cmp-nvim-lsp-signature-help',
  --event = 'InsertEnter',
  --dependencies = { 'hrsh7th/nvim-cmp' },
  --},
  -- Optional: A specific C++ tool for advanced refactoring (like include guards)
  { 'pogyomo/cppguard.nvim' },
  {
    'folke/trouble.nvim',
    opts = {}, -- Use opts = {} for default options, or customize as needed
    cmd = 'Trouble', -- Optional: lazy-load on command
  },
  {
    'krady21/compiler-explorer.nvim',
  },
}
