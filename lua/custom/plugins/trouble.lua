-- trouble.nvim
vim.pack.add({'https://github.com/folke/trouble.nvim'})

require('trouble').setup {
  -- leave empty for defaults, or customize:
  modes = {
    diagnostics = {
      auto_close = true,   -- close when no more diagnostics
      focus = false,       -- don't steal focus when opening
    },
    symbols = {
      focus = false,
      win = { position = 'right' },
    },
  },
}

-- keymaps
vim.keymap.set('n', '<leader>q', '<cmd>Trouble diagnostics toggle<cr>',                          { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',             { desc = 'Buffer diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>',                  { desc = 'Symbols (Trouble)' })
vim.keymap.set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',   { desc = 'LSP (Trouble)' })
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>',                              { desc = 'Location list (Trouble)' })
vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>',                               { desc = 'Quickfix list (Trouble)' })
