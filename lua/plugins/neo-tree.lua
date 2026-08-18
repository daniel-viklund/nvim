-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'NeoTree toggle', silent = true })

-- `use_libuv_file_watcher` below picks up external changes via OS file events
-- (FSEvents on macOS). That does not work on network mounts / VM shared
-- folders / iCloud-style paths, so as a fallback also refresh the tree
-- whenever Neovim regains focus or a :terminal command finishes.
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermLeave', 'TermClose' }, {
  group = vim.api.nvim_create_augroup('neotree-refresh', { clear = true }),
  desc = 'Refresh neo-tree after external changes',
  callback = function()
    local ok, manager = pcall(require, 'neo-tree.sources.manager')
    if ok then
      manager.refresh 'filesystem' -- no-op when the tree window is not open
    end
  end,
})

require('neo-tree').setup {
  filesystem = {
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ['<C-o>'] = function(state)
          local node = state.tree:get_node()
          os.execute('open -R "' .. node.path .. '"')
        end,
      },
    },
  },
}
