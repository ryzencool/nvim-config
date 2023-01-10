local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

--[[ local protocol = require("vim.lsp.protocol") ]]

local lsp_defaults = nvim_lsp.util.default_config

lsp_defaults.capabilities =
vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "javascript", "typscript", "javascriptreact", "typescriptreact", "typescript.tsx", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.tailwindcss.setup({})
