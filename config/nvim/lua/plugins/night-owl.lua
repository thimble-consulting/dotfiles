return {
  "oxfist/night-owl.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("night-owl").setup({
      light_mode = true,
    })
    vim.cmd.colorscheme("night-owl")
  end,
}
