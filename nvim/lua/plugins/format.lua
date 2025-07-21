return {
  "stevearc/conform.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  lazy = false,
  config = function()
    require("conform").setup({
      -- Set formatters to use by file type.
      -- Conform can run multiple formatters sequentially with e.g.:
      --   python = { "isort", "black" },
      -- or can run only the first available formatter by using a sub-list, with e.g.:
      --   javascript = { { "prettierd", "prettier" } },
      -- Use the "*" filetype to run formatters on all filetypes.
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        svelte = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        jsonc = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        graphql = { "prettierd", "prettier" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Use the "*" filetype to run formatters on all filetypes.
        --   e.g.: ["*"] = { "codespell" },
        ["*"] = {},
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        --   e.g.: ["_"] = { "trim_whitespace" },
        ["_"] = {},
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    })
  end,
}
