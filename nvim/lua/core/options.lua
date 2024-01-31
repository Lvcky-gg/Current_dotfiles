local opt = vim.opt
local g = vim.g

-- Cursor highlighting
opt.cursorline = true
opt.cursorcolumn = true

-- Pane splitting
opt.splitright = true
opt.splitbelow = true

-- Searching
opt.smartcase = true
opt.ignorecase = true

-- Make terminal support truecolor
opt.termguicolors = true

-- Make neovim use the system clipboard
opt.clipboard = 'unnamedplus'

-- Disable old vim status
opt.showmode = false

-- Set relative line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Tab config
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true

-- Code folding
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = '1'

-- Decrease update time
opt.updatetime = 200

-- Disable swapfile
opt.swapfile = false

-- Enable persistent undo
opt.undofile = true

-- Always show tabline
opt.showtabline = 0

-- Disable mouse support
opt.mouse = ''

-- Scrolloff
opt.scrolloff = 5
opt.sidescrolloff = 5

-- Disable wrapping
opt.wrap = false

-- Show invisible characters
opt.list = true

-- Fill chars
opt.fillchars = { eob = ' ', diff = '╱', fold = ' ', foldsep = ' ', foldopen = '', foldclose = '' }

-- Enable lazy redraw for performance
opt.lazyredraw = true

-- Have the statusline only display at the bottom
opt.laststatus = 3

-- Confirm to save changed before exiting the modified buffer
opt.confirm = true

-- Hide * markup for bold and italic
opt.conceallevel = 3

-- Hide the command line unless needed
opt.cmdheight = 0

-- Use ripgrep as the grep program for neovim
opt.grepprg = 'rg --vimgrep'

-- Set the grep format
opt.grepformat = '%f:%l:%c:%m'

-- shortmess options
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Enable autowrite
opt.autowrite = true

-- Keep cursor to the same screen line when opening a split
opt.splitkeep = 'screen'

-- Set completion options
opt.completeopt = 'menu,menuone,noselect'

-- Set key timeout to 300ms
opt.timeoutlen = 300

-- Window config
opt.winwidth = 5
opt.winminwidth = 5
opt.equalalways = false

-- Always show the signcolumn
opt.signcolumn = 'yes'

-- Formatting options
opt.formatoptions = 'jcroqlnt'

-- Put the cursor at the start of the line for large jumps
opt.startofline = true

-- Allow cursor to move where this is no text is visual block mode
opt.virtualedit = 'block'

-- Command-line completion mode
opt.wildmode = 'longest:full,full'

-- Session save options
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }

-- Enable autowrite
opt.autowrite = true

-- Maximum number of undo changes
opt.undolevels = 10000

-- Only display 20 items in a completion menu
-- NOTE: Mixed feelings about this, maybe disable later
opt.pumheight = 20

-- Disable lsp logging
vim.lsp.set_log_level('OFF')

-- Disable certain builtins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logipat = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_fzf = 1

-- Disable provider warnings in the healthcheck
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
