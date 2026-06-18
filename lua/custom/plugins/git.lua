vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim' }

-- configuration
vim.g.lazygit_floating_window_scaling_factor = 1
vim.g.lazygit_floating_window_winblend = 0

-- keymap
vim.keymap.set('n', '<leader>fg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- gitsigns: inline hunks, staging, blame
vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }
-- configuration
require('gitsigns').setup {
  current_line_blame = true,
}
-- keymaps
local gs = require('gitsigns')
vim.keymap.set('n', ']h', function() gs.nav_hunk('next') end, { desc = 'Next hunk' })
vim.keymap.set('n', '[h', function() gs.nav_hunk('prev') end, { desc = 'Prev hunk' })
vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
-- vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Blame line' })
-- vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'Diff this file' })


-- diffview: review diffs across files / revisions
vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }
-- configuration
require('diffview').setup {}
-- keymaps
vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'Diffview: open' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'Diffview: file history' })
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>', { desc = 'Diffview: close' })

local function set_diff_hl()
  -- vim.appi.nvim_set_hl(0, "DiffChange", {})                        -- no line-wide bg
  vim.api.nvim_set_hl(0, "DiffText", { bg = "#684a00", bold = true })  -- only the changed chars
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = set_diff_hl })
set_diff_hl()

vim.opt.diffopt:append("linematch:60")
