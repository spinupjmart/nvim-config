return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    --@module 'neo-tree'
    --@type neotree.Config?
    opts = {
    },
    config = function()
        -- setup neotree keymaps
        vim.keymap.set('n', '<leader>b', ':Neotree toggle buffers position=float<cr>', {silent = true, desc = 'Show open buffers in Neotree'})
        vim.keymap.set('n', '<leader>s', ':Neotree toggle float git_status<cr>', {silent = true, desc = 'Git status in Neotree'})
        vim.keymap.set('n', '<leader>tt', ':Neotree toggle position=float<CR>', {silent = true, desc = 'Open Neotree in current buffer (e.g., netrw)'})
    end
}
