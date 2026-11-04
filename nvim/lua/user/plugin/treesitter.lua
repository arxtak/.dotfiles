return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        parsers = {
            "lua",
            "go",
            "html",
            "css",
            "javascript",
            "kotlin",
        },
        filetypes = {
            "lua",
            "go",
            "html",
            "css",
            "javascript",
            "javascriptreact",
            "kotlin",
        },
        highlight = true,
        indent = true,
        folds = false,
    },
    config = function(_, opts)
        local ts = require("nvim-treesitter")

        ts.install(opts.parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = opts.filetypes,

            callback = function()
                if opts.highlight then
                    vim.treesitter.start()
                end

                if opts.indent then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end

                if opts.folds then
                    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo[0][0].foldmethod = "expr"
                end
            end,
        })
    end,
}
