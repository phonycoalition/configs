local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

require'lspconfig'.typst_lsp.setup{
    settings = {
        exportPdf = "onSave" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
    }
}
