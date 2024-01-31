# My neovim config

This isn't anything all too special, just your standard config.

<!--toc:start-->

- [My neovim config](#my-neovim-config)
  - [IMPORTANT NOTICES](#important-notices)
  - [Installation](#installation)
  - [Dependencies](#dependencies)
  - [Screenshots](#screenshots)
  - [Plugins](#plugins)
  - [License](#license)

<!--toc:end-->

## IMPORTANT NOTICES

1. This config is oriented with ***myself*** in mind, so there may possibly be
   confusing or otherwise strange choices made in the config. Regardless, it works
   for me. Decide for yourself if I made a janky shitbox of a config, or something
   actually usable for people other than me.

1. This is a living config, assume nothing is final. Plugins will inevitably
   change and break. Again, this is a config for myself, not for the masses. Use
   at your own risk.

1. This config was build around the ***latest*** version of neovim, as I run an
   Arch-linux based distro. Do not expect this to work without the latest
   neovim package.

## Installation

```bash
git clone --depth 1 https://codeberg.org/j4de/nvim.git ~/.config/nvim && nvim
```

## Dependencies

| Dependency | Reason                                 |
|------------|----------------------------------------|
| git        | To install the config and plugins      |
| npm        | Used to install certain mason packages |
| ripgrep    | Used to give telescope results         |

## Screenshots

![A screenshot of my neovim config first opening, with dashboard-nvim
being the start screen](https://codeberg.org/j4de/nvim/raw/commit/65ba70a45e072efd164ee4efd378d37f47e0ac81/assets/Screenshot_2023-11-02_15-49-52.png)
![A screenshot of various files open, including ui.lua, lsp.lua, and editor.lua](https://codeberg.org/j4de/nvim/raw/commit/65ba70a45e072efd164ee4efd378d37f47e0ac81/assets/Screenshot_2023-11-02_16-03-21.png)
![A screenshot of telescope.nvim open, hovering over LICENSE.md](https://codeberg.org/j4de/nvim/raw/commit/65ba70a45e072efd164ee4efd378d37f47e0ac81/assets/Screenshot_2023-11-02_16-04-00.png)

## Plugins

- [BufOnly.nvim](https://github.com/numToStr/BufOnly.nvim)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [actions-preview.nvim](https://github.com/aznhe21/actions-preview.nvim)
- [animation.nvim](https://github.com/anuvyklack/animation.nvim)
- [better-escape.nvim](https://github.com/max397574/better-escape.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [cmp-async-path](https://github.com/FelipeLema/cmp-async-path)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [dial.nvim](https://github.com/monaqa/dial.nvim)
- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [flit.nvim](https://github.com/ggandor/flit.nvim)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [goto-breakpoints.nvim](https://github.com/ofirgall/goto-breakpoints.nvim)
- [highlight-undo.nvim](https://github.com/tzachar/highlight-undo.nvim)
- [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [lsp_lines.nvim](https://git.sr.ht/~whynothugo/lsp_lines.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
- [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [middleclass](https://github.com/anuvyklack/middleclass)
- [mini.ai](https://github.com/echasnovski/mini.ai)
- [mini.animate](https://github.com/echasnovski/mini.animate)
- [mini.bufremove](https://github.com/echasnovski/mini.bufremove)
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [mini.move](https://github.com/echasnovski/mini.move)
- [mini.surround](https://github.com/echasnovski/mini.surround)
- [mini.trailspace](https://github.com/echasnovski/mini.trailspace)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [neodev.nvim](https://github.com/folke/neodev.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)
- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-origami](https://github.com/chrisgrieser/nvim-origami)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [persistence.nvim](https://github.com/folke/persistence.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [promise-async](https://github.com/kevinhwang91/promise-async)
- [rainbow-delimiters.nvim](https://github.com/hiphish/rainbow-delimiters.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [treesj](https://github.com/Wansmer/treesj)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [twilight.nvim](https://github.com/folke/twilight.nvim)
- [undotree](https://github.com/mbbill/undotree)
- [vim-cool](https://github.com/romainl/vim-cool)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [vim-kitty](https://github.com/fladson/vim-kitty)
- [vim-matchup](https://github.com/andymass/vim-matchup)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [windows.nvim](https://github.com/anuvyklack/windows.nvim)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)

## License

MIT-0
