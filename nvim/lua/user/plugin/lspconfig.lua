return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.config("cssls", {
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            })

            vim.lsp.document_color.enable(true, nil, {
                style = "virtual",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local ok, builtin = pcall(require, "telescope.builtin")

                    if ok then
                        vim.keymap.set("n", "<leader>d", builtin.diagnostics, opts)

                        vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, opts)
                        vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, opts)
                        vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, opts)
                        vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
                    end

                    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
