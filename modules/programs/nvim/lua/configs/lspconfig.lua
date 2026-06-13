local nvlsp = require "nvchad.configs.lspconfig"

-- Configure each LSP using the new vim.lsp.config API
local servers = { "lua_ls", "nil_ls", "ts_ls", "pyright", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end
