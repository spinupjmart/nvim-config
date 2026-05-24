return {
    -- mason -> mason-lspconfig -> lspconfig
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'fortls',
                    'julials',
                    'lua_ls',
                    'marksman',
                    'pyright',
                    'zls'
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Configure the LSPs
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config('fortls', {
                cmd = {
                    'fortls',
                    '--lowercase_intrinsics',
                    '--hover_signature',
                    '--hover_language=fortran',
                    '--use_signature_help'
                },
                capabilities = capabilities,
                --filetypes = {'fortran', '*.f', '*.f90'},
                --root_dir = require('lspconfig').util.root_pattern('*.f90'),
                --root_pattern = {'*.f', '*.f90'},
            })
            vim.lsp.config('julials', {
                capabilities = capabilities,
            })
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}, -- Recognize vim as a global variable
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                -- Include Neovim runtime files
                                vim.env.VIMRUNTIME,
                                --vim.api.nvim_get_runtime_file('', true),
                            },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },

                },
            })
            vim.lsp.config('marksman', {
                capabilities = capabilities,
            })
            vim.lsp.config('pyright', {
                capabilities = capabilities,
            })
            vim.lsp.config('zls', {
                capabilities = capabilities,
            })
            -- Enable the LSPs with the above configurations
            vim.lsp.enable({
                'julials',
                'lua_ls',
                'marksman',
                'pyright',
                'zls'
            })
            -- add border to diagnostic messages
            -- vim.diagnostic.config({
            --     virtual_text = true,
            --     float = {
            --         border = 'rounded',
            --     }
            -- })
            -- Setup LSP keymaps
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- remap diagnostic float
                    map('gK', vim.diagnostic.open_float, 'Open diagnostic message')

                    -- add border to hover
                    -- map('K', function() vim.lsp.buf.hover {border = 'rounded'} end, 'Hover')
                    map('K', vim.lsp.buf.hover, 'Hover')

                    -- remap diagnostic jump
                    map('gn', function() vim.diagnostic.jump {count=1} end, 'Jump to next diagnostic')
                    map('gp', function() vim.diagnostic.jump {count=-1} end, 'Jump to previous diagnostic')

                    -- go to definition
                    --   jump back with <C-t>.
                    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

                    -- goto declaration
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- go to implementation
                    --  useful when language has ways of declaring types without an actual implementation
                    map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

                    -- rename variable under the cursor
                    --  most LSPs also support renaming across files
                    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- execute a code action (usually cursor needs to be on top of an error)
                    -- or a suggestion from LSP for this to activate
                    map('gra', vim.lsp.buf.code_action, '[G]oto code [A]ction', { 'n', 'x' })

                    -- find references for the word under the cursor.
                    map('grr', vim.lsp.buf.references, '[G]oto [R]eferences')

                    -- list all symbols in the current buffer in the location-list
                    --  symbols include variables, functions, types, etc.
                    map('gO', vim.lsp.buf.document_symbol, '[O]pen document symbols')

                    -- list all symbols in the current workspace in the quickfix window
                    map('gW', vim.lsp.buf.workspace_symbol, 'Open [W]orkspace symbols')

                    -- goto the definition of the type of the symbol under the cursor
                    map('grt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')

                    -- add the folder at path to workspace folders
                    --   if no path provided, user is prompted for path using input()
                    map('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add folder to workspace')

                    -- remove the folder at path from workspace folders
                    --   if no path provided, user is prompted for path using input()
                    map('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove folder from workspace')

                    -- list folders in the workspace
                    map('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List workspace folders')
                end,
            })
        end
    },
}
