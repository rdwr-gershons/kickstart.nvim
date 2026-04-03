-- Kubernetes plugin
return {
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
}
