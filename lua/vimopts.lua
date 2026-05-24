-- setup general vim options and keymaps

-- Define the leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Set default window border to rounded
vim.o.winborder = 'rounded'

-- Turn on line numbers by default
vim.opt.number = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show the mode since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save the undo history
vim.opt.undofile = true

-- Ignore case when searching (case-insensitive search)
vim.opt.ignorecase = true

-- One capital letter or \C in the search string forces case sensitive search
vim.opt.smartcase = true

-- Keep signcolumn on by default (add column of 2 characters to display signs)
vim.opt.signcolumn = 'yes'

-- Decrease the update time of the swap file (ms) - default is 4000
vim.opt.updatetime = 250

-- Decrease time to wait for mapped sequence to complete
vim.opt.timeoutlen = 300

-- Configure new splits to right of current window for vsplit
vim.opt.splitright = true

-- Configure new splits to below current window for hsplit
vim.opt.splitbelow = true

-- Set how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live as you type them out
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 5

-- If performing an operation that would fail due to unsaved changes in the
-- buffer (like `:q`), instead raise a dialog asking if you wish to save the
-- current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Number of spaces for <Tab>
vim.opt.softtabstop = 4

-- Number of spaces for autoindent
vim.opt.shiftwidth = 4

-- Default to use spaces instead of tab
vim.opt.expandtab = true

-- Enable smart indent
vim.opt.smartindent = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Switch tabs more intuitively
vim.keymap.set('n', 'gl', ':tabprevious<CR>', {silent = true, desc = 'Go to previous tab'})
vim.keymap.set('n', 'gr', ':tabnext<CR>', {silent = true, desc = 'Go to next tab'})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit
--   easier for people to discover. By default, you  need to press <C-\><C-n>
--   which is not what someone will guess without a bit more experience.
--   NOTE: This won't work in all terminal emulators/tmux/etc. 
--   Try your own mapping
--   Or just use default <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keymaps to make split navigation easier.
--   Use CTRL+<hjkl> to switch between windows
--   See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

