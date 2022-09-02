local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local h = require("null-ls.helpers")
local runtime_path = vim.split(package.path, ';')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  debug = false,
  sources = {
    -- Formatting ---------------------
    --  brew install shfmt
    -- formatting.shfmt,
    -- StyLua
    -- formatting.stylua,
    -- frontend
    formatting.prettier.with({ -- 比默认少了 markdown
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
      },
      extra_filetypes = { "njk" },
      prefer_local = "node_modules/.bin",
    }),
    -- Diagnostics  ---------------------
    diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
    diagnostics.cspell.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      generator_opts = {
        command = "cspell",
        args = function(params)
            print(vim.inspect(runtime_path))
            return {
                "--language-id",
                params.ft,
                "--config",
                "/Users/alan/.config/develop-config/neovim/cspell.json",
                "stdin",
            }
        end,
        to_stdin = true,
        ignore_stderr = true,
        format = "line",
        check_exit_code = function(code)
            return code <= 1
        end,
        on_output = h.diagnostics.from_pattern(
            [[.*:(%d+):(%d+)%s*-%s*(.*%((.*)%))]],
            { "row", "col", "message", "_quote" },
            {
                adapters = { h.diagnostics.adapters.end_col.from_quote },
                severities = {
                  ["error"] = 4,
                  ["warning"] = 4,
                  ["information"] = 3,
                  ["hint"] = 4,
                }
            }
        ),
      },
    }),
    -- code actions ---------------------
    -- code_actions.gitsigns,
    code_actions.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
  },
  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  -- 提示格式： [eslint] xxx
  diagnostics_format = "[#{s}] #{m}",
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
  end,
})
