return {
  {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      sections = {
        lualine_x = { 'encoding', 'filetype' },
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    config = true,
    event = 'VeryLazy',
    init = function()
      vim.notify = require('notify')
    end
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { "H",         "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev buffer" },
      { "L",         "<cmd>BufferLineCycleNext<cr>",   desc = "Next buffer" },
      { "<leader><", "<cmd>BufferLineMovePrev<cr>",    desc = "Move buffer left" },
      { "<leader>>", "<cmd>BufferLineMoveNext<cr>",    desc = "Move buffer right" },
      { "<leader>C", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    },
    opts = function()
      local colors = require('nord.colors')
      local normal = {
        fg = colors.nord4_gui,
        bg = colors.nord1_gui,
        sp = colors.nord3_gui,
        underline = true,
      }
      local selected = {
        fg = colors.nord8_gui,
        bg = colors.nord2_gui,
        sp = colors.nord9_gui,
        underline = true,
        bold = true,
        italic = true,
      }
      local function extend(defaults, tbl)
        return vim.tbl_extend('force', defaults, tbl)
      end

      return {
        options = {
          separator_style = 'slant',
          close_command = function(buf)
            if not vim.bo[buf].modified then
              require('mini.bufremove').delete(buf)
            end
          end,
          left_mouse_command = false,
          right_mouse_command = false,
          middle_mouse_command = false,
          show_buffer_close_icons = false,
          show_close_icons = false,
          always_show_bufferline = false,
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(_count, level)
            local signs = require('lsp.diagnostics').signs
            if level:match('error') then
              return signs.Error
            elseif level:match('warning') then
              return signs.Warn
            end
            return ''
          end
        },
        highlights = {
          fill = {
            bg = colors.nord0_gui,
            sp = colors.nord1_gui,
            underline = true,
          },
          background = {
            fg = colors.nord4_gui,
            bg = colors.nord1_gui,
            sp = colors.nord3_gui,
            underline = true,
          },
          buffer_selected = {
            fg = colors.nord8_gui,
            bg = colors.nord2_gui,
            sp = colors.nord9_gui,
            underline = true,
          },
          buffer_visible = selected,
          separator = {
            fg = colors.nord0_gui,
            bg = colors.nord1_gui,
            sp = colors.nord3_gui,
            underline = true,
          },
          separator_selected = {
            fg = colors.nord0_gui,
            bg = colors.nord2_gui,
            sp = colors.nord9_gui,
            underline = true,
          },
          separator_visible = {
            fg = colors.nord0_gui,
            bg = colors.nord2_gui,
            sp = colors.nord9_gui,
            underline = true,
          },
          error = normal,
          error_selected = selected,
          error_visible = selected,
          error_diagnostic = extend(normal, {
            fg = colors.nord11_gui,
          }),
          error_diagnostic_selected = extend(selected, {
            fg = colors.nord11_gui,
          }),
          error_diagnostic_visible = extend(selected, {
            fg = colors.nord11_gui,
          }),
          warning = normal,
          warning_selected = selected,
          warning_visible = selected,
          warning_diagnostic = extend(normal, {
            fg = colors.nord15_gui,
          }),
          warning_diagnostic_selected = extend(selected, {
            fg = colors.nord15_gui,
          }),
          warning_diagnostic_visible = extend(selected, {
            fg = colors.nord15_gui,
          }),
          info = normal,
          info_selected = selected,
          info_visible = selected,
          info_diagnostic = normal,
          info_diagnostic_selected = selected,
          info_diagnostic_visible = selected,
          hint = normal,
          hint_selected = selected,
          hint_visible = selected,
          modified = {
            fg = colors.nord14_gui,
            bg = colors.nord1_gui,
            sp = colors.nord3_gui,
            underline = true,
          },
          modified_selected = {
            fg = colors.nord14_gui,
            bg = colors.nord2_gui,
            sp = colors.nord9_gui,
            underline = true,
          },
          modified_visible = {
            fg = colors.nord14_gui,
            bg = colors.nord2_gui,
            sp = colors.nord9_gui,
            underline = true,
          },
        },
      }
    end
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
