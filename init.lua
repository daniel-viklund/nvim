-- Based on kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim).
--
-- Thin entry point. Editor settings live in `lua/config/*`, and plugins live in
-- `lua/plugins/*` (loaded in the order defined by `lua/plugins/init.lua`).
--
-- If you experience any errors, run `:checkhealth` for more info.

-- [[ Foundation ]]
-- Order matters: leaders must be set before plugins load, and the `vim.pack`
-- build hooks (config.pack) must be registered before any plugin is added.
require 'config.options'
require 'config.keymaps'
require 'config.diagnostics'
require 'config.autocmds'
require 'config.pack'

-- [[ Plugins ]]
require 'plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
