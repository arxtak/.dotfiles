return {
    "mfussenegger/nvim-lint",
    opts = {
        events = { "BufWritePost" },
        linters_by_ft = {
            go = { "golangcilint" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
        },
    },
    config = function(_, opts)
        local lint = require("lint")

        lint.linters_by_ft = opts.linters_by_ft

        vim.diagnostic.config({
            virtual_text = { current_line = true },
        })

        vim.api.nvim_create_autocmd(opts.events, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
