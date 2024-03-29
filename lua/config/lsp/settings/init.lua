-- lsp-config
-- https://github.com/neovim/nvim-lspconfig
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).

local lspconfig = require("lspconfig")

local lsp_flags = {
    debounce_text_changes = 150,
}

local on_attach = require("config.lsp.handlers").on_attach
local capabilities = require("config.lsp.handlers").capabilities

-- language servers config

-- lua
local lua_ls_opts = require("config.lsp.settings.lua_ls")
lspconfig.lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    lua_ls_opts
}

-- json
local jsonls_opts = require("config.lsp.settings.jsonls")
lspconfig.jsonls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    jsonls_opts
}


-- python
local pyright_opts = require("config.lsp.settings.pylsp")
lspconfig.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    pyright_opts
}

-- cpp
-- Mason without ccls...(con't understand why)
--[[ local ccls_opts = require("config.lsp.settings.ccls") ]]
--[[ lspconfig.ccls.setup{ ]]
--[[     on_attach = on_attach, ]]
--[[     capabilities = capabilities, ]]
--[[     flags = lsp_flags, ]]
--[[     ccls_opts ]]
--[[ } ]]

local clangd_opts = require("config.lsp.settings.clangd")
lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    clangd_opts
}

-- markdown
local marskman_opts = require("config.lsp.settings.marksman")
lspconfig.marksman.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    marskman_opts
}

-- shell
local bashls_opts = require("config.lsp.settings.bashls")
lspconfig.bashls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    bashls_opts
}
