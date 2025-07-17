return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, for file icons
  },
  config = function()
    require('nvim-tree').setup {
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        -- Apply default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Remove the default mapping for '-'
        vim.keymap.del('n', '-', { buffer = bufnr })

        -- Add custom mapping for '-' to toggle the tree
        vim.keymap.set('n', '-', api.tree.toggle, { buffer = bufnr, noremap = true, silent = true })
      end,

      -- Add any other nvim-tree configuration options here
      view = {
        width = 30, -- adjust as needed
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      -- Other configuration options...
    }

    -- Global mapping to toggle nvim-tree
    vim.keymap.set('n', '-', require('nvim-tree.api').tree.toggle, { desc = 'NvimTree Toggle' })
  end,
}
