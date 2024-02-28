require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "clangd", "html", "jsonls", "sqls", "vimls", "yamlls", }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require("lspconfig").pyright.setup { on_attach = on_attach }
require("lspconfig").clangd.setup { on_attach = on_attach }
require("lspconfig").html.setup { on_attach = on_attach }
require("lspconfig").jsonls.setup { on_attach = on_attach }
require("lspconfig").sqls.setup { on_attach = on_attach }
require("lspconfig").vimls.setup { on_attach = on_attach }
require("lspconfig").yamlls.setup { on_attach = on_attach }
