require("dirghayu.lazy")
require("dirghayu.plugins")
require("dirghayu.remap")
require("dirghayu.set")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.python3_host_prog=vim.fn.expand("~/miniforge3/envs/neovim/bin/python3")

-- empty setup using defaults
require("ibl").setup()
require("toggleterm").setup{}
require("org-bullets").setup()
require("tint").setup({
  transforms = {
    require("tint.transforms").tint_with_threshold(-100, "#1C1C1C", 150),  -- Try to tint by `-100`, but keep all colors at least `150` away from `#1C1C1C`
    require("tint.transforms").saturate(0.5),
  }
})
