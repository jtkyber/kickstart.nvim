return {
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {
    -- indent = { char = '|' },
  },
  config = function(_, opts)
    local hooks = require 'ibl.hooks'

    -- Optional: Custom colors (subtle gray in most themes)
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#333333' }) -- Adjust hex as needed
      vim.api.nvim_set_hl(0, 'IblScope', { fg = '#555555' }) -- Slightly darker for scope
    end)

    require('ibl').setup {
      indent = { highlight = 'IblIndent' },
      scope = { highlight = 'IblScope' }, -- scope.enabled remains true by default
    }
  end,
}
