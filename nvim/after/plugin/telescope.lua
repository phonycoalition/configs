local builtin = require('telescope.builtin')

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "timeshift",
            "miniforge3"
        }
    }
}

local wk = require("which-key")

wk.register({
  f = {
    name = "[F]ile", -- optional group name
    f = {builtin.find_files, "Find [F]ile"},
    g = {builtin.live_grep, "Live [G]rep"},
    r = {builtin.oldfiles, "[R]ecent Files"},
    w = {builtin.grep_string, "Grep [W]ord"},
  },

  l = {
      name = "LSP",
      D = {vim.lsp.buf.declaration, '[G]oto [D]eclaration'},
      d = {builtin.lsp_definitions, '[G]oto [D]efinition'},
      r = {builtin.lsp_references, '[G]oto [R]eferences'},
      n = {vim.lsp.buf.rename, '[R]e[n]ame'},
      s = {builtin.lsp_document_symbols, 'Document [S]ymbols'},
      w = {builtin.lsp_dynamic_workspace_symbols, '[W]orkspace Symbols'},
  }
}, { prefix = "<leader>" })
