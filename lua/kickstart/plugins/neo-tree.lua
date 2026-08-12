-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  default_component_configs = {
    git_status = {
      -- VSCode-style letter badges instead of the default symbols
      symbols = {
        added = 'A',
        modified = 'M',
        deleted = 'D',
        renamed = 'R',
        untracked = 'U',
        ignored = '',
        unstaged = '',
        staged = 'S',
        conflict = 'C',
      },
    },
  },
  filesystem = {
    -- Refresh the tree automatically when files change on disk (e.g. agent edits)
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
