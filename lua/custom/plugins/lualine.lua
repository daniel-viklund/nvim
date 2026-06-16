vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
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
      refresh_time = 16,
      events = {
        'WinEnter', 'BufEnter', 'BufWritePost', 'SessionLoadPost',
        'FileChangedShellPost', 'VimResized', 'Filetype',
        'CursorMoved', 'CursorMovedI', 'ModeChanged',
      },
    }
  },

  -- bottom empty
  sections = {},
  inactive_sections = {},

  -- LEAVE THIS EMPTY so bufferline keeps the tabline
  tabline = {},

  -- lualine info goes here, just under bufferline
  winbar = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      { 'filename', path = 1 },
      { 'diagnostics', sources = { 'nvim_lsp' } },
    },
    lualine_x = {
      { 'searchcount', maxcount = 999 },
      { 'selectioncount' },
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

  -- minimal info on unfocused splits
  inactive_winbar = {
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'location' },
  },

  extensions = {}
}

-- remove the empty bottom statusline bar
vim.opt.laststatus = 0
