return {
  enabled = true,
  'numToStr/FTerm.nvim',
  init = function()
    vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
