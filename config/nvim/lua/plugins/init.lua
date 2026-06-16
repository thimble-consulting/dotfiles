return {
  "folke/lazydev.nvim",
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap)')
      vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
    end
  },
  "prisma/vim-prisma",
  "rking/ag.vim",
  "nathangrigg/vim-beancount",
  "roxma/vim-tmux-clipboard",
  {
    "sbdchd/neoformat",
    config = function ()
      vim.g.neoformat_try_node_exe = 1
    end
  },
  "tmux-plugins/vim-tmux-focus-events", -- support for vim-tmux-clipboard
  {
    "scrooloose/nerdtree",
    cond = (function() return not vim.g.vscode end),
    init = function()
      -- Disable NERDTree's Ctrl-j/k mappings to allow vim-tmux-navigator to work
      vim.g.NERDTreeMapJumpNextSibling = '<Nop>'
      vim.g.NERDTreeMapJumpPrevSibling = '<Nop>'
    end
  },
  {
    "scrooloose/nerdcommenter",
    cond = (function() return not vim.g.vscode end)
  },
  {
    "jgdavey/tslime.vim",
    cond = (function() return not vim.g.vscode end)
  },
  {
    "vim-test/vim-test",
    cond = (function() return not vim.g.vscode end)
  },
  {
    "christoomey/vim-tmux-navigator",
    cond = (function() return not vim.g.vscode end),
    lazy = false,  -- Load immediately to ensure keybindings are set
  },
  "rlue/vim-fold-rspec",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "tpope/vim-rails",
  "tpope/vim-surround",
  "vim-ruby/vim-ruby",
  "hashivim/vim-terraform",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",

    -- Telescope doesn't work with VSCode
    cond = (function() return not vim.g.vscode end)
  }
}
