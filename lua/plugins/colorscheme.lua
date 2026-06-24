-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
vim.pack.add { 'https://github.com/ember-theme/nvim' }
vim.pack.add { 'https://github.com/barrettruth/midnight.nvim' }
vim.pack.add { 'https://github.com/blazkowolf/gruber-darker.nvim' }
vim.cmd.colorscheme 'gruber-darker'
-- vim.cmd.colorscheme 'ember'
-- vim.cmd.colorscheme 'midnight'
