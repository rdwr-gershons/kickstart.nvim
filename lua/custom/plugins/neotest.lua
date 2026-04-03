-- Run/debug unitest for golang
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'fredrikaverpil/neotest-golang', -- The Go adapter
    'leoluz/nvim-dap-go', -- Dependency for Go debugging
  },
  keys = {
    { '<leader>tt', function() require('neotest').run.run(vim.fn.expand '%') end, desc = 'Run all File tests' },
    { '<leader>tr', function() require('neotest').run.run() end, desc = 'Run Nearest Test' },
    { '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Toggle Test Summary' },
    { '<leader>to', function() require('neotest').output_panel.toggle() end, desc = 'Show Test Output' },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-golang' {
          -- Use gotestsum for better stability and output handling
          -- Make sure gotestsum is installed and in your PATH
          runner = 'gotestsum',
          -- Optional: Add specific arguments to the Go test command
          -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          -- Enable debugging with nvim-dap-go
          dap_go_enabled = true,
          -- Disable warnings for duplicated test names
          warn_test_name_dupes = false,
          -- Configuration for neotest-golang
          go_test_args = { '-v', '-race', '-count=1', '-timeout=60s' },
        },
      },
      -- Optional: configure how test output is displayed
      output = {
        open_on_run = true,
      },
      -- Optional: configure status signs (virtual text, icons, etc.)
      status = {
        virtual_text = true,
      },
    }
  end,
}
