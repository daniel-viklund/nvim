vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
vim.opt.termguicolors = true
require('bufferline').setup {}

-- cycle / close buffers
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>blr', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bll', ':BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>blo', ':BufferLineCloseOthers<CR>')

-- delete buffers without closing their window (mini.bufremove, from mini.nvim)
require('mini.bufremove').setup()
vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete(0, false) end)
vim.keymap.set('n', '<leader>bla', function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then require('mini.bufremove').delete(buf, false) end
  end
end)
