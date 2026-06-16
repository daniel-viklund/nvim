vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },  -- powerline arrows; needs a Nerd Font
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },

  -- bottom is now empty
  sections = {},
  inactive_sections = {},

  -- everything lives at the top
  tabline = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      { 'filename', path = 1 },                          -- 0=name, 1=relative, 3=absolute
      { 'diagnostics', sources = { 'nvim_lsp' } },
    },
    lualine_x = {
      { 'searchcount', maxcount = 999 },                 -- live / match count
      { 'selectioncount' },                              -- chars/lines in visual mode
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = {
      'location',
      { function() return os.date('%H:%M') end, icon = '' },
    },
  },

  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- hide the empty bottom statusline bar
vim.opt.laststatus = 0
