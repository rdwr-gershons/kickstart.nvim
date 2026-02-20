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
      { '<leader>k', '<cmd>lua require("kubectl").toggle()<cr>' },
      { '<C-k>', '<Plug>(kubectl.kill)', ft = 'k8s_*' },
      { '7', '<Plug>(kubectl.view_nodes)', ft = 'k8s_*' },
      { '8', '<Plug>(kubectl.view_overview)', ft = 'k8s_*' },
      { 'C-t', '<Plug>(kubectl.view_top)', ft = 'k8s_*' },
    },
  },
}
