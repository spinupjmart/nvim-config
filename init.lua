-- load general vim options and keyamps
require('vimopts')

-- structured setup for lazy
-- see ~/.config/nvim/lua/config/lazy.lua
require("config.lazy")

-- enable treesitter highlighting given filetype in buffer
-- needed with transition to Neovim 0.12
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if lang then
        if vim.treesitter.language.add(lang) then
          vim.treesitter.start(args.buf, lang)
        end
    end
  end,
})

-- TODO: configure snippets

