return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "gopls",
                "html-lsp",
                "css-lsp",
                "tailwindcss-language-server",
                "typescript-language-server",
                "kotlin-lsp",
                "golangci-lint",
                "eslint_d",
                "prettier",
            },
        },
    },
}
