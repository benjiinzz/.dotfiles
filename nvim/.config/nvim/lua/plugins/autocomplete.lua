-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  event = 'VimEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    local kind_icons = {
      Text = '󰉿',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '󰜢',
      Variable = '󰀫',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '󰑭',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '',
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-Space>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.open_docs()
          else
            cmp.complete()
          end
        end, { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-k>'] = cmp.mapping(function()
          if cmp.visible_docs() then
            cmp.close_docs()
          else
            cmp.open_docs()
          end
        end, { 'i', 'c' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      experimental = {
        ghost_text = true,
      },
      formatting = {
        format = function(entry, vim_item)
          local icon = kind_icons[vim_item.kind] or ''

          if entry.source.name == 'nvim_lsp' then
            local ok, color_item = pcall(function()
              return require('nvim-highlight-colors').format(entry.completion_item.documentation, { kind = vim_item.kind })
            end)

            if ok and color_item and color_item.abbr ~= '' then
              icon = color_item.abbr
            end
            if ok and color_item and color_item.abbr_hl_group then
              vim_item.kind_hl_group = color_item.abbr_hl_group
            end
          end

          vim_item.kind = icon ~= '' and (icon .. ' ' .. vim_item.kind) or vim_item.kind
          return vim_item
        end,
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.score,
          function(entry1, entry2)
            local e1_snippet_exact = entry1.source.name == 'luasnip' and entry1.exact
            local e2_snippet_exact = entry2.source.name == 'luasnip' and entry2.exact
            if e1_snippet_exact ~= e2_snippet_exact then
              return e1_snippet_exact
            end
          end,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      sources = cmp.config.sources {
        { name = 'lazydev', group_index = 0 },
        { name = 'luasnip', priority = 900 },
        { name = 'nvim_lsp', priority = 800 },
        { name = 'nvim_lsp_signature_help', priority = 700 },
        { name = 'path', priority = 600 },
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}
