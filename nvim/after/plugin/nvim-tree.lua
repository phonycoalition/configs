local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")
    local FloatPreview = require("float-preview")

    api.config.mappings.default_on_attach(bufnr)

    FloatPreview.attach_nvimtree(bufnr)
end

require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
