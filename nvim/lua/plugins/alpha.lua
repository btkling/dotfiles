return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local hostname = vim.uv.os_gethostname()
        local system = vim.loop.os_uname().sysname
        local date = os.date("%Y-%m-%d %H:%M")
        local image = {}
        if hostname == "L-BKLING01" then
            image = {
                [[                                ]],
                [[               )))              ]],
                [[              (((               ]],
                [[            +-----+             ]],
                [[            |     |]            ]],
                [[            `-----'             ]],
            }
        else
            image = {
                [[                                ]],
                [[          |   |  -----          ]],
                [[          |   |    |            ]],
                [[          |---|    |            ]],
                [[          |   |    |            ]],
                [[          |   |  -----          ]],
                [[                                ]],
            }
        end
        dashboard.section.header.val = {
            [[ ------------------------------ ]],
            [[  HostName: ]] .. hostname .. [[ ]],
            [[  System:   ]] .. system .. [[ ]],
            [[  Date:     ]] .. date .. [[ ]],
            [[ ------------------------------ ]],
            unpack(image),
        }
        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰍉  Find file", ":lua require('fzf-lua').files() <CR>"),
            dashboard.button("t", "  Browse cwd", ":NvimTreeOpen<CR>"),
            dashboard.button("g", "  Neogit cwd", "<cmd>Neogit<CR>"),
            dashboard.button("c", "  Config", ":e $XDG_CONFIG_HOME/nvim/<CR>"),
            dashboard.button("m", "  Mappings", ":e $XDG_CONFIG_HOME/nvim/lua/config/keymaps.lua<CR>"),
            dashboard.button("p", "  Plugins", ":Lazy<CR>"),
            dashboard.button("h", "󰋠  Health Check", ":checkhealth<CR>"),
            dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
        }

        dashboard.section.footer.val = {
            [[ ---------------------- ]],
        }

        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
