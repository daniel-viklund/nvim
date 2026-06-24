vim.pack.add({
    'https://github.com/SmiteshP/nvim-navic'
})

require('nvim-navic').setup({
    lsp = { auto_attach = true },   -- hooks itself onto any LSP that attaches
    highlight = true,
    separator = ' › ',
})
