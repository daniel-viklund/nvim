vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>blr', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bll', ':BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>blo', ':BufferLineCloseOthers<CR>')
require("mini.bufremove").setup()
vim.keymap.set("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end)
vim.keymap.set('n', '<leader>bla', function()
  local bufs = vim.api.nvim_list_bufs()
  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      require("mini.bufremove").delete(buf, false)
    end
  end
end)

vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')
