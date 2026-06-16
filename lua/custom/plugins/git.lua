vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim' }

-- configuration
vim.g.lazygit_floating_window_scaling_factor = 1
vim.g.lazygit_floating_window_winblend = 0

-- keymap
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
