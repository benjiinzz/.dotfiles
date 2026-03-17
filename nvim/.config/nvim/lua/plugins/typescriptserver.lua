return { {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
}, {
  "dmmulroy/tsc.nvim",
  config = function()
    require("tsc").setup({
      vim.keymap.set('n', '<leader>to', ':TSCOpen<CR>'),
      vim.keymap.set('n', '<leader>tc', ':TSCClose<CR>') })
  end,
}, {
  "windwp/nvim-ts-autotag",
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false
  }
} }
