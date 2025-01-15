return {
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
}
