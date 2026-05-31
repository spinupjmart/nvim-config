return {
    "iamcco/markdown-preview.nvim",
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    config = function()
        vim.fn['mkdp#util#install']()
    end,
    vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', {silent = true, desc = 'Start Markdown preview'}),
    vim.keymap.set('n', '<leader>mps', ':MarkdownPreviewStop<CR>', {silent = true, desc = 'Stop Markdown preview'}),
    vim.keymap.set('n', '<leader>mpt', ':MarkdownPreviewToggle<CR>', {silent = true, desc = 'Toggle Markdown preview'})
}
