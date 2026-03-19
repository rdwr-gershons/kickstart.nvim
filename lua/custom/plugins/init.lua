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
      { 'e', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
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
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      {
        'nvim-treesitter/nvim-treesitter', -- Optional, but recommended
        branch = 'main', -- NOTE; not the master branch!
        build = function() vim.cmd ':TSUpdate go' end,
      },
      {
        'fredrikaverpil/neotest-golang',
        version = '*', -- Optional, but recommended; track releases
        build = function()
          vim.system({ 'go', 'install', 'gotest.tools/gotestsum@latest' }):wait() -- Optional, but recommended
        end,
      },
    },
    config = function()
      local config = {
        runner = 'gotestsum', -- Optional, but recommended
      }
      require('neotest').setup {
        adapters = {
          require 'neotest-golang'(config),
        },
      }
    end,
  },
  {
    'krady21/compiler-explorer.nvim',
  },
  {
    'mrjones2014/mdpreview.nvim',
    ft = 'markdown', -- you can lazy load on markdown files only
    -- requires the `terminal` filetype to render ASCII color and format codes
    dependencies = { 'norcalli/nvim-terminal.lua', config = true },
    config = function()
      require('mdpreview').setup {
        cli_args = {
          'glow',
          '-w',
          '1',
        },
        filetypes = { 'markdown', 'markdown.pandoc', 'markdown.gfm' },
      }
    end,
  },
  {
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
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons', -- optional
    },
    keys = {
      { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover symbol doc' },
      { 'grf', '<cmd>Lspsaga finder<cr>', desc = 'Find symbol references' },
      { 'grfi', '<cmd>Lspsaga finder imp<cr>', desc = 'Find implementations of interfaces' },
    },
    -- init = function()
    --   vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    -- end,
    config = function() require('lspsaga').setup {} end,
  },
}
