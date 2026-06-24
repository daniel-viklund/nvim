vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }
require('toggleterm').setup {
  open_mapping = [[<C-\>]],
  direction = 'tab',
  float_opts = {
    border = 'curved',
  },
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

vim.keymap.set('n', '<leader>gg', function() lazygit:toggle() end, { desc = 'LazyGit' })
