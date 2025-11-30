return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    opts = {
        highlight = {
            enable = true,
        },
        ensure_installed = {
            "bash",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
            "tsx",
            "typescript",
            "yaml",
        },
    },
}
