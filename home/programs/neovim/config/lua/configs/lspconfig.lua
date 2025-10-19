-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "nixd", "pyright", "elixirls", "jdtls", "clangd", "lemminx", "qmlls", "hls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

lspconfig.denols.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.elixirls.setup {
  cmd = { 'elixir-ls'}
}

lspconfig.qmlls.setup {
    cmd = {"qmlls", "-E"}
}

lspconfig.hls.setup {
    filetypes = {"haskell", "lhaskell", "cabal"}
}

lspconfig.clangd.setup {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
}

-- lspconfig.java_language_server.setup {
--     cmd = { "java-language-server" }
-- }
lspconfig.jdtls.setup{}
