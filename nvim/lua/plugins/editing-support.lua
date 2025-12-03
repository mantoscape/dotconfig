return {
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>cc",
          block = "<leader>Cc",
        },
        opleader = {
          line = "<leader>c",
          block = "<leader>C",
        },
        extra = {
          above = "<leader>cu",
          below = "<leader>cd",
          eol = "<leader>ce",
        },
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        -- max_lines = -1,
      })

      vim.keymap.set("n", "[c", function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end, { silent = true })
    end,
  },
}
