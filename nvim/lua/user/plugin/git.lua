return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "tpope/vim-fugitive",
    },
    opts = {
        current_line_blame_opts = {
            delay = 500,
        },
        on_attach = function()
            vim.keymap.set("n", "<leader>hi", "<cmd>Gitsigns preview_hunk<CR>")
            vim.keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
        end,
    },
}
