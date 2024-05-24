return {
  { "rcarriga/nvim-notify", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "lukas-reineke/indent-blankline", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = false }
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
        experimental = { ghost_text = false }
    }
  },
}
