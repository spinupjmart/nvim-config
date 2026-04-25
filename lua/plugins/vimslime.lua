return {
    {
        "jpalardy/vim-slime",
        init = function()
            vim.g.slime_target = "tmux"
            vim.g.slime_no_mappings = true
            -- default: 1 tmux window, 2 panes
            vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
            vim.g.slime_cell_delimiter = "# %%"
            vim.g.slime_bracketed_paste = 1
        end,
        config = function()
            vim.keymap.set("n", "<leader>sc", "<Plug>SlimeConfig<CR>", { remap = true, silent = false, desc = "slime config" })
            vim.keymap.set("n", "<leader>sl", "<Plug>SlimeLineSend<CR>", { remap = true, silent = true, desc = "slime send line to REPL" })
            vim.keymap.set("v", "<leader>sl", "<Plug>SlimeRegionSend<CR>", { remap = true, silent = true, desc = "slime send visual selection to REPL" })
            vim.keymap.set("n", "<leader>si", "<Plug>SlimeSendCell<CR>", { remap = true, silent = true, desc = "slime send cell to REPL" })
        end
    },
}
