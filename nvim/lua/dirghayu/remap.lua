local wk = require("which-key")
local trim_spaces = true


vim.g.mapleader = " "

vim.keymap.set("x", "<leader>p", "\"_dP")

wk.register({
    b = {
        name = "[B]uffer",
        l = {"<cmd>Telescope buffers<CR>", "Buffer [L]ist"},
        n = {"<cmd>bnext<CR>", "Buffer [N]ext"},
        p = {"<cmd>bprev<CR>", "Buffer [P]revious"},
    },

    c = {
        name = "[C]ompile",
        j = {"<cmd>! julia %<CR>", "[J]ulia"},
        r = {"<cmd>! Rscript %<CR>", "[R]"},
        t = {"<cmd>! typst compile %<CR>", "[T]ypst"},
    },

    d = {
        name = "[D]irectory Tree",
        c = {"<cmd>NvimTreeCollapse<CR>", "Collapse NvimTree"},
        d = {"<cmd>NvimTreeToggle<CR>", "Toggle NvimTree"},
        f = {"<cmd>NvimTreeFindFileToggle<CR>", "Toggle NvimTree at Current File"}
    },

    o = {name = "[O]rg Mode"},

    r = {
        name = "[R]esize window",
        h = {"<cmd>vertical resize -2<CR>", "Shrink vertical size"},
        j = {"<cmd>resize -2<CR>", "Shrink horizontal size"},
        k = {"<cmd>resize +2<CR>", "Expand horizontal size"},
        l= {"<cmd>vertical resize +2<CR>", "Expand vertical size"},
    },

    s = {
        name = "[S]end to Terminal",
        l = {
            function()
                require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
            end, "Send [L]ine"
        }
    },

    t = {
        name = "[T]erminal",
        f = {"<cmd>ToggleTerm direction=float<cr>", "[F]loat"},
        j = {"<cmd>lua _JULIA_TOGGLE()<cr>", "[J]ulia"},
        p = {"<cmd>lua _PYTHON_TOGGLE()<cr>", "[P]ython"},
        r = {"<cmd>lua _R_TOGGLE()<cr>", "[R]"},
        s = {"<cmd>ToggleTerm size=20 direction=horizontal<cr>", "[S]plit Horizontal"},
        v = {"<cmd>ToggleTerm size=80 direction=vertical<cr>", "Split [V]ertical"},
    },

    w = {
        name = "Traverse [W]indow",
        h = { "<C-w>h", "Move to tab on Left" },
        j = { "<C-w>j", "Move to tab Below"},
        k = { "<C-w>k", "Move to tab Above"},
        l = { "<C-w>l", "Move to tab on Right"},
    },
}, { mode = "n", prefix = "<leader>" })

wk.register({
    s = {

        s = {
            function()
                require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
            end, "Send Visual [S]election"
        },
        v = {
            function()
                require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
            end, "Send [V]isual Line"
        },
    }
}, { mode = "v", prefix = "<leader>"})
