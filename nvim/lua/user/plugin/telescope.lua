return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>" },
    },
    opts = function()
        return {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)
        telescope.load_extension("ui-select")
    end,
}
