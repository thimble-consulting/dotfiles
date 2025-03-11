return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require('telescope.actions');
    require('telescope').setup{
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git/",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          }
        },
        vimgrep_arguments = {
          "ag",
          "--nocolor",
          "--noheading",
          "--numbers",
          "--column",
          "--smart-case",
          "--silent",
          "--vimgrep",
        }
      },
      pickers = {
        find_files = {
          hidden = true
        }
      }
    }
  end
}
