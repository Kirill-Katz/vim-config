return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        local ensure_installed = {
            "vimdoc",
            "javascript",
            "typescript",
            "c",
            "lua",
            "rust",
            "jsdoc",
            "bash",
            "templ",
        }

        -- Install any missing parsers asynchronously. Existing parsers are a no-op.
        treesitter.install(ensure_installed):raise_on_error()

        -- Highlighting is now provided directly by Neovim and must be enabled
        -- explicitly for each buffer. pcall keeps unsupported filetypes quiet.
        local group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })

        -- Preserve the previous mixed Vim syntax + Treesitter behavior for Markdown.
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = "markdown",
            callback = function()
                vim.bo.syntax = "markdown"
            end,
        })
    end,
}
