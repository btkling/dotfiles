-- Andromeda
-- return {
--     "nobbmaestro/nvim-andromeda",
--     dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
--     priority = 1000,
--     opts = {},
-- }

-- EVERGARDEN
-- return {
--     "everviolet/nvim",
--     name = "evergarden",
--     priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
--     opts = {
--         theme = {
--             variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
--             accent = "green",
--         },
--         editor = {
--             transparent_background = false,
--             sign = { color = "none" },
--             float = {
--                 color = "mantle",
--                 invert_border = false,
--             },
--             completion = {
--                 color = "surface0",
--             },
--         },
--     },
-- }

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}
