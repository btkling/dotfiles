vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

local hostname = vim.uv.os_gethostname()
if hostname == "L-BKLING01" then
    vim.g.python3_host_prog = "/home/bkling/.pyenv/versions/py3nvim/bin/python"
end

vim.diagnostic.config({
    virtual_text = {
        source = "always",
    },
    float = {
        source = "always",
    },
})
