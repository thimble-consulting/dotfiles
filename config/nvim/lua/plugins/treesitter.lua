return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "hcl",
        "heex",
        "javascript",
        "terraform",
        "typescript",
        "tsx",
        "ruby",
        "html"
      },
      sync_install = false,
      -- default highlight was true it seems like night-owl theme
      -- is able to leverage treesitter and highlight better when
      -- set to false
      highlight = { enable = false },
      indent = { enable = true },
    })

    local foldSettings = vim.api.nvim_create_augroup('Vim Fold Settings', { clear = true })

    -- FROM: https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
    --  JS
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.opt.foldcolumn = "0"
    -- vim.opt.foldtext = ""
    -- vim.opt.foldnestmax = 1
    -- -- vim.opt.foldlevel = 99
    -- -- vim.opt.foldlevelstart = 0
    -- RUBY
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.opt.foldcolumn = "0"
    -- vim.opt.foldtext = ""
    -- vim.opt.foldnestmax = 1
    -- -- vim.opt.foldlevel = 99
    -- -- vim.opt.foldlevelstart = 0

    -- vim.api.nvim_create_autocmd('FileType', {
    --   pattern = { '*.rb' },
    --   callback = function()
    --     vim.opt.foldmethod = 'indent'
    --     vim.opt.foldlevelstart = 1
    --   end,
    --   group = generalSettingsGroup,
    -- })

  end
}
