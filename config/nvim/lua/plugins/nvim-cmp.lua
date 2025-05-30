return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    -- "mlaursen/vim-react-snippets", -- https://github.com/mlaursen/vim-react-snippets
  },
  config = function()
    local cmp = require("cmp")
    -- vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local luasnip = require("luasnip")
    luasnip.filetype_extend("ruby", {"rails"})
    luasnip.filetype_extend("typescriptreact", { "html" })
    luasnip.filetype_extend("javascriptreact", { "html" })


    cmp.setup({
      snippet = {
        -- REQUIRED: specify a Snippet Engine.
        -- LuaSnip is a snippet engine (not specific to Lua).
        --   Another option is ultisnips, which is more mature but runs on python
        --   as a separate process.
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and luasnip.expandable() then
              luasnip.expand()
            elseif cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip', option = { show_autosnippets = true } }, -- For luasnip users.
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'path' },
      })
    })

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
