return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<CR>',          desc = '[G]it [D]iff open' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<CR>',   desc = '[G]it [H]istory' },
    { '<leader>gf', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it [F]ile history (current)' },
    { '<leader>gc', '<cmd>DiffviewClose<CR>',         desc = '[G]it [C]lose diffview' },
  },
}
