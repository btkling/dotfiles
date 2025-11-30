return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        "ibhagwan/fzf-lua", -- optional
    },
    opts = {
        graph_style = "unicode",
        process_spinner = true,
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
        -- The diffview integration enables the diff popup.
        diffview = nil,

        -- If enabled, uses fzf-lua for menu selection.
        -- Requires you to have `ibhagwan/fzf-lua` installed.
        fzf_lua = true,
    },
}
