return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Setup for treesitter
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the listed parsers must be installed)
            -- Note - dependencies for parsers include:
            --   Javascript runtime and C compiler in PATH (default for JS is node)
            --   Make sure C compiler and node are installed
            ensure_installed = {
                'bash',
                'bibtex',
                'c',
                'diff',
                'fortran',
                'html',
                'julia',
                'latex',
                'lua',
                'luadoc',
                'make',
                'markdown',
                'markdown_inline',
                'python',
                'rust',
                'sql',
                'tmux',
                'vim',
                'vimdoc',
                'xml',
                'yaml',
                'zig'
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        }
    end
}
