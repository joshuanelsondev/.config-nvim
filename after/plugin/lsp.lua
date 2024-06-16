local lsp = require('lsp-zero')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'eslint', 'lua_ls'},
  handlers = {
    function(server_name)
      -- Check for the server name and add custom settings
      if server_name == 'eslint' then
        require('lspconfig')[server_name].setup({
          settings = {
            rules = {
              ["import/no-commonjs"] = "off"
            }
          }
        })
      else
        require('lspconfig')[server_name].setup({})
      end
    end,
  },
})
require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}, -- Recognize 'vim' as a global variable
      },
    },
  },
}

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()
