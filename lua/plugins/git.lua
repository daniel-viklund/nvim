-- All git tooling in one place:
--   * gitsigns  - gutter signs, inline hunks, staging, blame
--   * lazygit   - full-screen git TUI
--   * diffview  - review diffs across files / revisions
--
-- NOTE: gitsigns used to be configured in two places (base signs here, blame
-- elsewhere), which meant the second `setup` reset the signs back to defaults.
-- It is now a single `setup` call so the custom signs actually take effect.

-- gitsigns
vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
  current_line_blame = true,
}

local gs = require 'gitsigns'
vim.keymap.set('n', ']h', function() gs.nav_hunk 'next' end, { desc = 'Next hunk' })
vim.keymap.set('n', '[h', function() gs.nav_hunk 'prev' end, { desc = 'Prev hunk' })
vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
-- vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Blame line' })
-- vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'Diff this file' })

-- lazygit
vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim' }
vim.g.lazygit_floating_window_scaling_factor = 1
vim.g.lazygit_floating_window_winblend = 0
vim.keymap.set('n', '<leader>fg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- diffview
vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }
require('diffview').setup {}
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'Diffview: open' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'Diffview: file history' })
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>', { desc = 'Diffview: close' })

-- only highlight the changed characters, not the whole line
local function set_diff_hl()
  vim.api.nvim_set_hl(0, 'DiffText', { bg = '#684a00', bold = true })
end
vim.api.nvim_create_autocmd('ColorScheme', { callback = set_diff_hl })
set_diff_hl()

vim.opt.diffopt:append 'linematch:60'
