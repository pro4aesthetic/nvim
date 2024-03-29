local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- lsp
require "config.lsp.mason"
require "config.lsp.mason-lspconfig"
-- lsp-config
require "config.lsp.handlers".setup{}
require "config.lsp.settings"
require "config.lsp.null-ls"

-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#asm_lsp
require "lspconfig".asm_lsp.setup{} -- use lsp-installer failed

-- fix: warning: multiple different client offset_encodings detected for buffer, this is not supported yet
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issue-1078814897
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end

require "lsp_lines".setup{}

local km = vim.keymap
km.set("n", "<leader>x", require "lsp_lines".toggle)