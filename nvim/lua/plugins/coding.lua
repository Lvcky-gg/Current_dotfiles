return {
  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = true,
    keys = {
      { 'gc', mode = { 'n', 'v' }, desc = 'Toggle comments' },
      { 'gb', mode = { 'n', 'v' }, desc = 'Toggle block comments' },
    },
  },

  -- dial.nvim
  {
    'monaqa/dial.nvim',
    keys = {
      -- stylua: ignore start
      { '<C-a>', function() return require('dial.map').inc_normal() end, expr = true, desc = 'Increment' },
      { '<C-x>', function() return require('dial.map').dec_normal() end, expr = true, desc = 'Decrement' },
      { 'g<C-a>', function() return require('dial.map').inc_gnormal() end, expr = true, desc = 'Multiline increment' },
      { 'g<C-x>', function() return require('dial.map').dec_gnormal() end, expr = true, desc = 'Multiline decrement' },
      { '<C-a>', function() return require('dial.map').inc_visual() end, mode = 'v', expr = true, desc = 'Increment' },
      { '<C-x>', function() return require('dial.map').dec_visual() end, mode = 'v', expr = true, desc = 'Decrement' },
      { 'g<C-a>', function() return require('dial.map').inc_gvisual() end, mode = 'v', expr = true, desc = 'Multiline increment' },
      { 'g<C-x>', function() return require('dial.map').dec_gvisual() end, mode = 'v', expr = true, desc = 'Multiline decrement' },
      -- stylua: ignore end
    },
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.integer.alias.octal,
          augend.integer.alias.binary,
          augend.constant.alias.bool,
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.constant.new({ elements = { 'and', 'or' }, word = true, cyclic = true }),
          augend.constant.new({ elements = { '&&', '||' }, word = true, cyclic = true }),
        },
      })
    end,
  },

  -- mini.ai
  {
    'echasnovski/mini.ai',
    keys = { { 'a', mode = { 'x', 'o' } }, { 'i', mode = { 'x', 'o' } } },
    opts = function()
      local ai = require('mini.ai')
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }, {}),
          f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
          c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
          t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },
        },
      }
    end,
  },

  -- nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'FelipeLema/cmp-async-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
      { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', version = 'v2.*', config = true },
    },
    event = 'InsertEnter',
    opts = function()
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
      local luasnip = require('luasnip')
      local cmp = require('cmp')
      local defaults = require('cmp.config.default')()
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end
      return {
        completion = { completeopt = 'menu,menuone' },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ['<C-CR>'] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'async_path' },
          { name = 'calc' },
          { name = 'nvim_lsp_signature_help' },
        }),
        formatting = {
          format = function(_, item)
            local icons = {
              Array = ' ',
              Boolean = ' ',
              Class = ' ',
              Color = ' ',
              Constant = ' ',
              Constructor = ' ',
              Copilot = ' ',
              Enum = ' ',
              EnumMember = ' ',
              Event = ' ',
              Field = ' ',
              File = ' ',
              Folder = ' ',
              Function = ' ',
              Interface = ' ',
              Key = ' ',
              Keyword = ' ',
              Method = ' ',
              Module = ' ',
              Namespace = ' ',
              Null = ' ',
              Number = ' ',
              Object = ' ',
              Operator = ' ',
              Package = ' ',
              Property = ' ',
              Reference = ' ',
              Snippet = ' ',
              String = ' ',
              Struct = ' ',
              Text = ' ',
              TypeParameter = ' ',
              Unit = ' ',
              Value = ' ',
              Variable = ' ',
            }
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = { ghost_text = { hl_group = 'CmpGhostText' } },
        sorting = defaults.sorting,
        window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
        view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
      }
    end,
    config = function(_, opts)
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.setup(opts)
      ---@diagnostic disable-next-line: missing-fields
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } },
      })
      ---@diagnostic disable-next-line: missing-fields
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' }, { name = 'cmdline' } }),
      })
      -- nvim-autopairs integration
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
