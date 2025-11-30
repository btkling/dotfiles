# BKNVIMCONFIG

## How to set up an LSP
- find the server you want with `:Mason`
- add to the `local servers = {...}` table in `lsp.lua`
    - if just a formatter, add later on
    - use the name (or alias) as the value and set it equal to an empty table
    - eg. for typescript language server `ts_ls = {}`
- restart nvim and confirm it is installed (`:Mason`)
- (optional) configure the server to your liking

## plugins to consider?
- [snacks.rename](https://github.com/folke/snacks.nvim/blob/main/docs/rename.md)

## other configs I have referenced
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [Seth Phaeno (youtube)](https://github.com/Sin-cy/dotfiles/tree/main/nvim/.config/nvim)
- [jakobwesthoff](https://github.com/jakobwesthoff/nvim-from-scratch/tree/main)

## Commands for reference
:h nvim-surround.usage


## Plugin list
[from RockerBOO](https://github.com/rockerBOO/awesome-neovim)


## Python
- just use uv
