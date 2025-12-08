local map = vim.keymap.set

---@diagnostic disable-next-line: undefined-field
local fzf = _G.FzfLua
----------------------------------------------------------------------------------------------------
-- Built-In Keymaps
----------------------------------------------------------------------------------------------------
-- Clear highlights on search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ctrl backspace and delete work as expected?
map("i", "<C-h>", "<C-w>", { noremap = true, silent = true, desc = "Delete previous word (Ctrl+Backspace)" })
map("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true })

--  Switch between windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- navigational
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
    local filePath = vim.fn.expand("%:p:h") -- Gets the file path relative to the home directory
    vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
    print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Diagnostics
map("n", "<leader>e", function()
    vim.diagnostic.open_float()
end, { desc = "open diagnostics in floating window" })

----------------------------------------------------------------------------------------------------
-- PLUGIN SPECIFIC
----------------------------------------------------------------------------------------------------

-- lazy itself
map({ "n" }, "<leader>l", "<cmd>Lazy<CR>", { desc = "initiate [L]azy" })

-- fzf-lua
map({ "n", "v" }, "<leader><leader>", "<cmd>FzfLua buffers<CR>", { desc = "search buffers" })
map({ "n", "v" }, "<leader>s.", "<cmd>FzfLua<CR>", { desc = "[S]earch all [.] commands" })
map({ "n", "v" }, "<leader>sb", "<cmd>FzfLua grep_curbuf<CR>", { desc = "[S]earch [B]uffer" })
map({ "n", "v" }, "<leader>sf", "<cmd>FzfLua files<CR>", { desc = "[S]earch [F]iles" })
map({ "n", "v" }, "<leader>sg", "<cmd>FzfLua live_grep<CR>", { desc = "[S]earch by [G]rep in cwd" })
map({ "n", "v" }, "<leader>sh", "<cmd>FzfLua helptags<CR>", { desc = "[S]earch Neovim [H]elp" })
map({ "n", "v" }, "<leader>sk", "<cmd>FzfLua keymaps<CR>", { desc = "[S]earch [K]eymaps" })
map({ "n", "v" }, "<leader>sn", function()
    fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
map({ "n", "v" }, "<leader>sw", "<cmd>FzfLua grep_cword<CR>", { desc = "[S]earch [w]ord" })
map({ "n", "v" }, "<leader>sW", "<cmd>FzfLua grep_cWORD<CR>", { desc = "[S]earch [W]ord" })

-- fzf-lua git based commands
map({ "n", "v" }, "<leader>stb", "<cmd>FzfLua git_branches<CR>", { desc = "[S]earch by gi[T] [B]ranches" })

-- nvim-tree
map("n", "\\", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvim-tree" })

-- oil
map("n", "-", "<cmd>Oil --float<CR>", { desc = "Oil at current [D]irectory" })

-- gitsigns & Neogit
map("n", "<leader>gb", "<cmd>:Neogit cwd=%:p:h<CR>", { desc = "Neo[G]it at current [B]uffer's directory" })
map("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[G]it [H]unk [P]review" })

local gs = package.loaded.gitsigns
-- stylua: ignore start
map("n", "]h", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        gs.nav_hunk("next")
    end
end,{desc =   "Next Hunk" })
map("n", "[h", function()
    if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
    else
        gs.nav_hunk("prev")
    end
end,{ desc = "Prev Hunk"})
map("n", "]H", function() gs.nav_hunk("last") end,{desc =  "Last Hunk"})
map("n", "[H", function() gs.nav_hunk("first") end,{desc =  "First Hunk"})
map("n", "<leader>ghS", gs.stage_buffer,{desc = "Stage Buffer"})
map("n", "<leader>ghu", gs.undo_stage_hunk,{desc = "Undo Stage Hunk"})
map("n", "<leader>ghR", gs.reset_buffer,{desc = "Reset Buffer"})
map("n", "<leader>ghp", gs.preview_hunk_inline,{desc = "Preview Hunk Inline"})
map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end,{desc = "Blame Line"})
map("n", "<leader>ghB", function() gs.blame() end,{desc = "Blame Buffer"})
map("n", "<leader>ghd", gs.diffthis,{desc = "Diff This"})
map("n", "<leader>ghD", function() gs.diffthis("~") end,{desc = "Diff This ~"})
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>",{desc = "GitSigns Select Hunk"})


-- ZK
local zk = require("zk")
map("n", "<leader>zl", "<cmd>ZkNotes<cr>", {desc = "[z]k [l]ist"})
map(
    "n",
    "<leader>zc",
    function()
        vim.ui.input({ prompt = "New zk note title: " }, function(title)
            if title and title ~= "" then
                zk.new({title = title, open = true})
            else
                print("Cancelled.")
            end
        end)
    end,
    {desc = "[z]k create"}
)
map("v", "<leader>znc", function()
    -- Get the visual selection
    local start_pos = vim.api.nvim_buf_get_mark(0, "<")
    local end_pos   = vim.api.nvim_buf_get_mark(0, ">")
    local lines = vim.api.nvim_buf_get_lines(0, start_pos[1]-1, end_pos[1], false)

    -- If multi-line, join them
    if #lines == 0 then
        print("No text selected")
        return
    end
    local content = table.concat(lines, "\n")

    -- Prompt for a title
    vim.ui.input({ prompt = "New zk note title: " }, function(title)
        if not title or title == "" then
            print("Cancelled.")
            return
        end

        -- Create a new note from content
        zk.new({
            title = title,
            content = content,
            open = true
        })
    end)
end, { desc = "[z]k [n]ew from [c]ontent selection", silent = true })

map("n", "<leader>znp", function()
    -- Get clipboard content
    local clipboard = vim.fn.getreg("+")  -- '+' is the system clipboard
    if clipboard == "" then
        print("Clipboard is empty")
        return
    end

    -- Prompt for a title
    vim.ui.input({ prompt = "New zk note title: " }, function(title)
        if not title or title == "" then
            print("Cancelled.")
            return
        end

        -- Create new zk note from clipboard
        zk.new({
            title = title,
            content = clipboard,
            open = true
        })
    end)
end, { desc = "[z]k [n]ew from [p]aste/clipboard" })
