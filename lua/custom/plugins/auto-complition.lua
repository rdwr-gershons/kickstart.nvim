return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    --'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    --'ray-x/lsp_signature.nvim',
  }, -- Ensure LuaSnip is a dependency
  config = function()
    -- General nvim-cmp setup
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    --require('lsp_signature').setup {}

    require('cmp').setup {
      --snippet = {
      --REQUIRED to make luasnip work with nvim-cmp
      --expand = function(args)
      --luasnip.lsp_expand(args.body) -- Use luasnip to expand snippets
      --end,
      --},
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP completion
        { name = 'luasnip' }, -- Snippets
      }, {
        { name = 'buffer' }, -- Buffer words
      }),

      -- Other nvim-cmp configuration options (mappings, etc.)
      -- Example mapping to select and jump to next argument
      mapping = cmp.mapping.preset.insert {
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept completion
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Select next item
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select previous item
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump() -- Jump through snippet arguments
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
    }
  end,
}
