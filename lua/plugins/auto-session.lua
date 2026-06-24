vim.pack.add { 'https://github.com/rmagatti/auto-session' }

require('auto-session').setup {
  pre_save_cmds = { 'Neotree close' },
}
