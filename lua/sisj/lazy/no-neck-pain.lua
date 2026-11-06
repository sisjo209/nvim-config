return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
        require("no-neck-pain").setup({
            width = 170,
            autocmds = {
                skipEnteringNoNeckPainBuffer = true,
            },
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("no-neck-pain").enable()
            end,
        })
    end,
}
