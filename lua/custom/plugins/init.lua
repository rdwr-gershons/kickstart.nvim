-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
}
