return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            keywordStyle = { italic = false},
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function()
                return {
                    ["@variable.builtin"] = { italic = false },
                }
            end,
        })
        vim.cmd.colorscheme 'kanagawa-dragon'
        -- remove cursor line highlighting
        vim.cmd([[highlight CursorLine cterm=NONE ctermbg=NONE guibg=NONE]])
    end,
}
