return {
  -- tokyonight.nvim
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    -- NOTE: Remove this once issue is fixed
    -- Related: https://github.com/folke/tokyonight.nvim/issues/452
    commit = 'e1e8ff2c8ff2bdc90ce35697291a5917adc8db5c',
    opts = {
      style = 'night',
      transparent = true,
      lualine_bold = true,
      terminal_colors = true,
      on_highlights = function(hl, c)
        local prompt = '#2d3149'
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
      end,
    },
    config = function(_, opts)
      local tokyonight = require('tokyonight')
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },

  -- nvim-notify
  {
    'rcarriga/nvim-notify',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    config = function(_, opts)
      local notify = require('notify')
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  -- dressing.nvim
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end,
    opts = {
      input = {
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
      },
    },
  },

  -- nvim-ufo
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      -- stylua: ignore start
      { 'zR', function() return require('ufo').openAllFolds() end, desc = 'Open all folds' },
      { 'zM', function() return require('ufo').closeAllFolds() end, desc = 'Close all folds' },
      -- stylua: ignore end
    },
    opts = {
      provider_selector = function(_, filetype, buftype)
        return (filetype == '' or buftype == 'nofile') and 'indent' or { 'treesitter', 'indent' }
      end,
    },
  },

  -- nvim-origami
  { 'chrisgrieser/nvim-origami', event = { 'BufReadPost', 'BufNewFile' }, config = true },

  -- windows.nvim
  {
    'anuvyklack/windows.nvim',
    dependencies = { 'anuvyklack/animation.nvim', 'anuvyklack/middleclass' },
    event = 'WinNew',
    config = true,
    keys = {
      { '<C-w>z', '<cmd>WindowsMaximize<CR>', desc = 'Max out current window' },
      { '<C-w>_', '<cmd>WindowsMaximizeVertically<CR>', desc = 'Max out window height' },
      { '<C-w>|', '<cmd>WindowsMaximizeHorizontally<CR>', desc = 'Max out window width' },
      { '<C-w>=', '<cmd>WindowsEqualize<CR>', desc = 'Equalize windows' },
    },
  },

  -- lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'dashboard',
          'NeogitStatus',
          'NeogitCommitView',
          'NeogitPopup',
          'NeogitConsole',
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          { 'diagnostics', sources = { 'nvim_lsp', 'nvim_diagnostic' } },
          {
            function()
              local ok, m = pcall(require, 'better_escape')
              return ok and m.waiting and '✺' or ''
            end,
          },
        },
        lualine_c = {
          'filename',
          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
            end,
            color_correction = 'static',
          },
        },
        lualine_x = {
          'fileformat',
          {
            'filetype',
            icon_only = true,
            separator = '',
            padding = { left = 1, right = 1 },
          },
          {
            function()
              return require('dap').status()
            end,
            cond = function()
              return package.loaded['dap'] and require('dap').status() ~= ''
            end,
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      extensions = {
        'man',
        'quickfix',
        'mason',
        'toggleterm',
        'neo-tree',
        'trouble',
        'lazy',
        'nvim-dap-ui',
      },
    },
  },

  -- dashboard-nvim
  {
    'nvimdev/dashboard-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VimEnter',
    opts = function()
      local opts = {
        theme = 'doom',
        config = {
          header = {
            '                                   ',
            '                                   ',
            '                                   ',
            '                                   ',
            '                                   ',
            '                                   ',
            '                                   ',
            '                                   ',
            '██╗░░░░░██╗░░░██╗░█████╗░██╗░░██╗██╗░░░██╗',
            '██║░░░░░██║░░░██║██╔══██╗██║░██╔╝╚██╗░██╔╝',
            '██║░░░░░╚██╗░██╔╝██║░░╚═╝█████═╝░░╚████╔╝░',
            '██║░░░░░░╚████╔╝░██║░░██╗██╔═██╗░░░╚██╔╝░░',
            '███████╗░░╚██╔╝░░╚█████╔╝██║░╚██╗░░░██║░░░',
            '╚══════╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░',
          },
          center = {
            -- stylua: ignore start
            { action = 'Telescope find_files', desc = ' Find file', icon = '󰈞 ', key = 'f' },
            { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'e' },
            { action = 'Telescope oldfiles', desc = ' Recent files', icon = '󰄉 ', key = 'r' },
            { action = 'Telescope live_grep', desc = ' Find text', icon = '󰊄 ', key = 'w' },
            { action = 'cd ~/.config/nvim | e ~/.config/nvim/init.lua', desc = ' Configuration', icon = '󰊄 ', key = 'c' },
            { action = 'Lazy update', desc = ' Update plugins', icon = ' ', key = 'u' },
            { action = 'Mason', desc = ' Mason', icon = ' ', key = 'm' },
            { action = 'Neogit', desc = ' NeoGit', icon = ' ', key = 'g' },
            { action = 'lua require("persistence").load({ last = true })', desc = ' Restore last session', icon = '󰦛 ', key = 'l' },
            { action = 'qa', desc = ' Quit Neovim', icon = ' ', key = 'q' },
            -- stylua: ignore end
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { 'Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      -- Close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'DashboardLoaded',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      return opts
    end,
  },

  -- which-key.nvim
  {
    'folke/which-key.nvim',
    keys = { '<leader>', '"', "'", '`', 'c', 'y', 'd', 'z', 'g', '[', ']' },
    opts = {
      operators = { gc = 'Comments', gb = 'Block comments' },
      defaults = {
        mode = { 'n', 'v' },
        ['g'] = { name = '+goto' },
        ['gc'] = { name = '+comments' },
        ['gb'] = { name = '+block comments' },
        ['gz'] = { name = '+surrounds' },
        [']'] = { name = '+next' },
        ['['] = { name = '+prev' },
        ['<leader>q'] = { name = '+quit/session' },
        ['<leader>f'] = { name = '+find' },
        ['<leader>b'] = { name = '+buffers' },
        ['<leader>g'] = { name = '+git' },
        ['<leader>x'] = { name = '+diagnostics/quickfix' },
        ['<leader>d'] = { name = '+debugger' },
      },
    },
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },

  -- bufferline.nvim
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '*',
    event = 'UIEnter',
    keys = {
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' },
      -- TODO: Figure out if there's maybe a better key for this keymap in particular
      { '<S-l>', '<cmd>BufferLineMoveNext<CR>', desc = 'Move current buffer forwards' },
      { '<S-h>', '<cmd>BufferLineMovePrev<CR>', desc = 'Move current buffer backwards' },
      { '<leader>bn', '<cmd>BufferLineMoveNext<CR>', desc = 'Move current buffer forwards' },
      { '<leader>bp', '<cmd>BufferLineMovePrev<CR>', desc = 'Move current buffer backwards' },
      -- stylua: ignore start
      { '<leader>bf', function() return require('bufferline').move_to(1) end, desc = 'Move buffer to beginning' },
      { '<leader>bl', function() return require('bufferline').move_to(-1) end, desc = 'Move buffer to end' },
      { '<leader>b1', function() return require('bufferline').go_to(1, true) end, desc = 'Jump to first buffer' },
      { '<leader>b2', function() return require('bufferline').go_to(2, true) end, desc = 'Jump to second buffer' },
      { '<leader>b3', function() return require('bufferline').go_to(3, true) end, desc = 'Jump to third buffer' },
      { '<leader>b4', function() return require('bufferline').go_to(4, true) end, desc = 'Jump to fourth buffer' },
      { '<leader>b5', function() return require('bufferline').go_to(5, true) end, desc = 'Jump to fifth buffer' },
      { '<leader>b6', function() return require('bufferline').go_to(6, true) end, desc = 'Jump to sixth buffer' },
      { '<leader>b7', function() return require('bufferline').go_to(7, true) end, desc = 'Jump to seventh buffer' },
      { '<leader>b8', function() return require('bufferline').go_to(8, true) end, desc = 'Jump to eighth buffer' },
      { '<leader>b9', function() return require('bufferline').go_to(9, true) end, desc = 'Jump to ninth buffer' },
      { '<leader>b$', function() return require('bufferline').go_to(-1, true) end, desc = 'Jump to last buffer' },
      -- stylua: ignore end
    },
    opts = {
      options = {
        numbers = function(opts)
          return string.format('%s', opts.ordinal)
        end,
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and ' ' .. diag.error .. ' ' or '')
            .. (diag.warning and ' ' .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    },
  },

  -- mini.animate
  {
    'echasnovski/mini.animate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = function()
      local animate = require('mini.animate')
      return {
        -- This is already handled by windows.nvim
        resize = { enable = false },
        open = { enable = false },
        close = { enable = false },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },

  -- mini.indentscope
  {
    'echasnovski/mini.indentscope',
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          ---@diagnostic disable-next-line: inject-field
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    event = { 'BufReadPost', 'BufNewFile' },
    opts = { symbol = '│', options = { try_as_border = true } },
  },
}
