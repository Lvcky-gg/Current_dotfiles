local map = vim.keymap.set
-- Set space as my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable space since I'm using it as my leader key
map({ 'n', 'v' }, '<Space>', '<Nop>', { expr = true, silent = true })

-- Better split navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

-- Quit neovim
map('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit the current file' })

-- Quick write
map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save the current file' })

-- Resize splits with arrow keys
map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Lazy keymap
map('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Open lazy.nvim' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Previous search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Previous search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Previous search result' })

-- Jump to diagnostics
local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- Switch to other buffer
map('n', '<leader>bb', '<cmd>e #<CR>', { desc = 'Switch to other buffer' })

-- Better up/down
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
