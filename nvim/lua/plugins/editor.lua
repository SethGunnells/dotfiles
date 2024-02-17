return {
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    'echasnovski/mini.pairs',
    version = false,
    config = true,
    opts = {
      mappings = {
        -- Adds spacing inside both brackets when present
        [' '] = { action = 'open', pair = '  ', neigh_pattern = '[%(%[{][%)%]}]' },
      },
    },
    event = { 'InsertEnter' },
  },
  {
    'echasnovski/mini.surround',
    version = false,
    opts = {
      mappings = {
        add = '<leader>.s',       -- Add surrounding in Normal and Visual modes
        delete = '<leader>.d',    -- Delete surrounding
        find = '',                -- Find surrounding (to the right)
        find_left = '',           -- Find surrounding (to the left)
        highlight = '<leader>.h', -- Highlight surrounding
        replace = '<leader>.r',   -- Replace surrounding
        update_n_lines = '',      -- Update `n_lines`
      },
    },
    keys = {
      { '<leader>.s', mode = { 'n', 'x' } },
      '<leader>.d',
      '<leader>.h',
      '<leader>.r',
    },
  },
  {
    'echasnovski/mini.bufremove',
    keys = {
      {
        '<leader>c',
        function()
          local bd = require('mini.bufremove').delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = 'Delete Buffer',
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'LazyFile',
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map('n', '<leader>gj', gs.next_hunk, 'Next Hunk')
        map('n', '<leader>gk', gs.next_hunk, 'Previous Hunk')
        map({ 'n', 'v' }, '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', 'Stage Hunk at Cursor')
        map({ 'n', 'v' }, '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', 'Reset Hunk at Cursor')
        map('n', '<leader>gp', gs.preview_hunk, 'Preview Hunk at Cursor')
      end
    },
  },
}
