return {
  "kevinhwang91/nvim-ufo",
  main = "ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",

  init = function()
    vim.o.foldcolumn = "auto:2"
    vim.o.fillchars = "foldopen:,foldclose:,foldsep: ,fold: "
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "manual"
  end,

  opts = {
    provider_selector = function(_, filetype, _)
      -- Map filetype -> treesitter language when possible (tsx, typescript, etc.)
      local lang = filetype
      if vim.treesitter and vim.treesitter.language and vim.treesitter.language.get_lang then
        local ok_lang, ts_lang = pcall(vim.treesitter.language.get_lang, filetype)
        if ok_lang and ts_lang then
          lang = ts_lang
        end
      end

      local has_ts = false
      local ok, parsers = pcall(require, "nvim-treesitter.parsers")
      if ok and parsers then
        if type(parsers.has_parser) == "function" then
          -- Newer API
          has_ts = parsers.has_parser(lang)
        elseif type(parsers.get_parser_configs) == "function" then
          -- Older API fallback
          local cfgs = parsers.get_parser_configs()
          has_ts = cfgs and cfgs[lang] ~= nil
        end
      end

      if has_ts then
        return { "lsp", "treesitter" } -- main + fallback
      end
      return { "lsp", "indent" }       -- main + fallback
    end,
  },

  keys = {
    { "zR", function() require("ufo").openAllFolds() end,               desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end,              desc = "Close all folds" },
    { "zr", function() require("ufo").openFoldsExceptKinds() end,       desc = "Open folds except kinds" },
    { "zm", function() require("ufo").closeFoldsWith() end,             desc = "Close folds with" },
    { "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
  },
}
