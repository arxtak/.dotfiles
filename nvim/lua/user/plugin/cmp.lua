return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "windwp/nvim-autopairs",
        "rafamadriz/friendly-snippets",
    },
    opts = function()
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        cmp.event:on("confirm_done", cmp_autopairs)

        local ls = require("luasnip")

        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        require("luasnip.loaders.from_vscode").lazy_load()

        return {
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-l>"] = cmp.mapping(function()
                    if ls.jumpable(1) then
                        ls.jump(1)
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if ls.jumpable(-1) then
                        ls.jump(-1)
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
        }
    end,
}
