return {
  'github/copilot.vim',
  -- Load on a specific event to improve startup time
  event = 'InsertEnter',
  config = function()
    -- Optional: Configure Copilot settings here
    -- For example, to disable it for specific filetypes:
    vim.g.copilot_filetypes = {
      ['*'] = true,
      ['markdown'] = false,
      ['help'] = false,
    }
  end,
}
