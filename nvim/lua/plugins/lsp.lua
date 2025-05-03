return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "folke/lazydev.nvim" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
            })

            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            require('lspconfig').cssls.setup({
                capabilities = capabilities,
            })

            require('lspconfig').clangd.setup({
                capabilities = capabilities,
            })

            require('lspconfig').ts_ls.setup({
                capabilities = capabilities,
            })

            require('lspconfig').pyright.setup({
                capabilities = capabilities,
            })

            require('lspconfig').bashls.setup({
                capabilities = capabilities,
                settings = {
                    bashIde = {
                        globPattern = "**/*.{sh,bash}",
                        backgroundAnalysisMaxFiles = 500,
                        enableShellcheck = true,
                    }
                },
                filetypes = {'sh', 'bash'},
                root_dir = function(fname)
                    return require('lspconfig').util.find_git_ancestor(fname) or vim.fn.getcwd()
                end,
                cmd = {'bash-language-server', 'start'},
                on_attach = function(client, bufnr)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

                    vim.api.nvim_echo({{"Bash language server attached"}}, false, {})
                end,
            })

            require('lspconfig').html.setup({
                capabilities = capabilities,
                root_dir = require('lspconfig').util.root_pattern('.git', 'package.json', 'index.html', '.'),
                filetypes = { "html", "htm", "xhtml", "shtml", "jsp", "hbs", "handlebars" },
                settings = {
                    html = {
                        validate = {
                            scripts = true,
                            styles = true,
                        },
                        hover = {
                            documentation = true,
                            references = true,
                        },
                        format = {
                            enable = true,
                            wrapLineLength = 120,
                            unformatted = "wbr",
                            contentUnformatted = "pre,code,textarea",
                            indentInnerHtml = true,
                        },
                        suggest = {
                            html5 = true,
                        },
                        Angular = {
                            suggest = false,
                        },
                        embeddedLanguages = {
                            css = true,
                            javascript = true,
                        },
                        autoClosingTags = true,
                        trace = {
                            server = "verbose",
                        },
                    },
                },
                on_attach = function(client, bufnr)
                    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

                    vim.api.nvim_echo({{"HTML language server attached with enhanced diagnostics"}}, false, {})
                end,
            })

        end,

    },
}
