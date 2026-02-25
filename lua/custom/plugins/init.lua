-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Kubernetes plugin
  {
    'ramilito/kubectl.nvim',
    -- use a release tag to download pre-built binaries
    opts = {},
    cmd = { 'Kubectl', 'Kubectx', 'Kubens' },
    keys = {
      { '<leader>k', '<cmd>lua require("kubectl").toggle()<cr>', mode = 'n', desc = '[k]ubernetes' },
      { '<C-k>', '<Plug>(kubectl.kill)', ft = 'k8s_*' },
      { '7', '<Plug>(kubectl.view_nodes)', ft = 'k8s_*' },
      { '8', '<Plug>(kubectl.view_overview)', ft = 'k8s_*' },
      { 'C-t', '<Plug>(kubectl.view_top)', ft = 'k8s_*' },
    },
  },
  -- auto session: restore last open files from closed nvim session
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        -- auto_session_suppress_dirs = { '~/', '~/GIT/waas/waas_enforcer/', '~/GIT/waas/waas_control/', '/' },
      }
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
  },
  {
    -- Snippet Engine
    { 'L3MON4D3/LuaSnip' },
    -- Snippet Collection (friendly-snippets includes C++ snippets)
    { 'rafamadriz/friendly-snippets' },
    -- Autocompletion Plugin
    {
      'hrsh7th/nvim-cmp',
      dependencies = { 'L3MON4D3/LuaSnip' }, -- Ensure LuaSnip is a dependency
    },
    -- Optional: A specific C++ tool for advanced refactoring (like include guards)
    { 'pogyomo/cppguard.nvim' },
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- Use opts = {} for default options, or customize as needed
    cmd = 'Trouble', -- Optional: lazy-load on command
  },
}
