vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", timeout = 150 })

        if vim.v.event.operator == "y" then
            vim.fn.setreg("+", vim.fn.getreg('"'))
        end
    end,
})
