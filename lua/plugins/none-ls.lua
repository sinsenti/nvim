return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        --css,html, etc
        null_ls.builtins.formatting.prettier,
        --python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort, -- Import sorter
        null_ls.builtins.diagnostics.mypy, -- Type checker
        null_ls.builtins.diagnostics.ruff, -- Linter

        --cpp
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cppcheck,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
