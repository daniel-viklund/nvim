-- Plugin load order.
--
-- The order is intentional: a few plugins depend on an earlier one already
-- being installed (e.g. `bufferline` uses `mini.bufremove` from `mini.nvim`,
-- and `roslyn`/`powershell`/`trouble` build on the LSP + Mason setup in `lsp`).
--
-- To add a plugin, drop a `lua/plugins/<name>.lua` file in this directory and
-- add its name to the list below. `config.pack` (build hooks + the `gh` helper)
-- is loaded by init.lua before this file, so every module may `require` it.

local modules = {
  -- Editing & UX
  'guess-indent',
  'mini', -- provides mini.bufremove, used by bufferline
  'which-key',
  'todo-comments',
  'autopairs',

  -- Appearance
  'colorscheme',
  'web-devicons', -- icons consumed by the plugins below
  'bufferline',
  'lualine',
  'navic',

  -- Files & sessions
  'neo-tree',
  'auto-session', -- closes neo-tree before saving a session

  -- Git (gitsigns + lazygit + diffview)
  'git',

  -- Terminal
  'toggleterm',

  -- Search
  'telescope',

  -- LSP & languages
  'lsp', -- Mason + server configs; must precede the language-specific plugins
  'roslyn',
  'powershell',
  'trouble',

  -- Completion, formatting, treesitter, debugging
  'completion',
  'formatting',
  'treesitter',
  'debug',

  -- Disabled examples (kept for reference; uncomment to enable)
  -- 'indent_line',
  -- 'lint',
  -- 'smear-cursor',
}

for _, name in ipairs(modules) do
  require('plugins.' .. name)
end
