return {
    -- the original maintainer has abandoned the project
    -- "ahmedkhalf/project.nvim",
    "DrKJeff16/project.nvim",
    config = function()
        -- require("project_nvim").setup({})
        require("project").setup({})
    end,
}
