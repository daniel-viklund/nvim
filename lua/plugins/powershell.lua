vim.pack.add { 'https://github.com/theleop/powershell.nvim' }
require('powershell').setup({
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services",
})
