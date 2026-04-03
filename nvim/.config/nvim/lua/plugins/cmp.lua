local utils = require('utils')
vim.pack.add({utils.gh('hrsh7th/nvim-cmp')})
vim.pack.add({utils.gh( 'hrsh7th/cmp-nvim-lsp')})
vim.pack.add({utils.gh( 'hrsh7th/cmp-buffer')})
vim.pack.add({utils.gh( 'hrsh7th/cmp-path')})
vim.pack.add({utils.gh( 'hrsh7th/cmp-cmdline')})
vim.pack.add({utils.gh(  'L3MON4D3/LuaSnip')})
vim.pack.add({utils.gh( 'saadparwaiz1/cmp_luasnip')})
vim.pack.add({utils.gh( 'chrisgrieser/cmp-nerdfont')})
vim.pack.add({utils.gh( 'onsails/lspkind.nvim')})
vim.pack.add({utils.gh( 'brenoprata10/nvim-highlight-colors')})
local cmp = require('cmp')
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
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({ ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp'},
      { name = 'luasnip'}, 
	{name = 'nerdfont'},
    }),
	experimental = {
        ghost_text = true,
      },
      formatting = {
	fields = { 'icon', 'abbr', 'kind', 'menu' },
        format = function(entry, vim_item)

          if entry.source.name == 'nvim_lsp' then
            local ok, color_item = pcall(function()
              return require('nvim-highlight-colors').format(entry.completion_item.documentation, { kind = vim_item.kind })
            end)

            if ok and color_item and color_item.abbr_hl_group then
              vim_item.kind_hl_group = color_item.abbr_hl_group
            end
          end

          return vim_item
        end,
      },
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

