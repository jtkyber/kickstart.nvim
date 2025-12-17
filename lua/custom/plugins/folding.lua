return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  event = 'VeryLazy', -- Optional: delays loading until needed
  init = function()
    -- Basic options for a normal experience (add these before setup() to override defaults)
    vim.o.foldcolumn = '1' -- Shows a fold indicator column; set to '0' if you prefer none
    vim.o.foldlevel = 99 -- Start with everything unfolded; adjust if needed
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require('ufo').setup {
      -- Use Tree-sitter for folding where available, fallback to indent
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    }
  end,
}
