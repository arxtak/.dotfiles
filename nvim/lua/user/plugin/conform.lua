return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 3000,
            lsp_fallback = true,
        },
    },
}
