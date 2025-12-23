-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      follow_current_file = {
        enabled = true, -- Always follow the current buffer's file
        leave_dirs_open = false, -- Optional: keep auto-expanded dirs open (set true if you prefer)
      },
      use_libuv_file_watcher = true,
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    -- Autocommand to open neo-tree automatically when entering a new tab
    vim.api.nvim_create_autocmd('TabNewEntered', {
      pattern = '*',
      callback = function()
        require('neo-tree.command').execute { action = 'show', reveal = true }
      end,
      desc = 'Open neo-tree in new tabs',
    })
  end,
}
