return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        keywords = {
            TODO = { icon = ' ', color = 'info' },
            HACK = { icon = ' ', color = 'warning' },
            WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
            PERF = { icon = '󱐋 ', color = '#ff00ff', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
            NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
            TEST = { icon = '󰙨 ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
        },
        highlight = {
            before = '',
            keyword = 'wide_fg',
            after = '',
        },
        gui_style = {
            fg = 'BOLD',
            bg = 'BOLD',
        },
    },
    vim.keymap.set('n', '<leader>tn', function()
        require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' }),
    vim.keymap.set('n', '<leader>tp', function()
        require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' }),
    vim.keymap.set('n', '<leader>tl', ':TodoTelescope<CR>', {silent = true, desc = 'Open TodoTelescope'})
}

