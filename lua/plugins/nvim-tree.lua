vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        on_attach = "default",
        hijack_cursor = false,
        auto_reload_on_write = true,
        disable_netrw = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        root_dirs = {},
        prefer_startup_root = false,
        sync_root_with_cwd = true,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        select_prompts = false,
        sort = {
          sorter = "name",
          folders_first = true,
          files_first = false,
        },
        view = {
          side = 'right',
          centralize_selection = false,
          cursorline = true,
          debounce_delay = 15,
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
          width = 50,
          float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 30,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          full_name = false,
          root_folder_label = ":~:s?$?/..?",
          indent_width = 2,
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
          highlight_git = "none",
          highlight_diagnostics = "none",
          highlight_opened_files = "none",
          highlight_modified = "none",
          highlight_hidden = "none",
          highlight_bookmarks = "none",
          highlight_clipboard = "name",
          indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },
          icons = {
            web_devicons = {
              file = {
                enable = true,
                color = true,
              },
              folder = {
                enable = false,
                color = true,
              },
            },
            git_placement = "before",
            modified_placement = "after",
            hidden_placement = "after",
            diagnostics_placement = "signcolumn",
            bookmarks_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
              hidden = true,
              diagnostics = true,
              bookmarks = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "󰆤",
              modified = "●",
              hidden = "󰜌",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        update_focused_file = {
          enable = false,
          update_root = {
            enable = false,
            ignore_list = {},
          },
          exclude = false,
        },
        system_open = {
          cmd = "",
          args = {},
        },
        git = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          disable_for_dirs = {},
          timeout = 400,
          cygwin_support = false,
        },
        diagnostics = {
          enable = false,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        modified = {
          enable = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
        },
        filters = {
          enable = true,
          git_ignored = false,
          dotfiles = true,
          git_clean = false,
          no_buffer = false,
          no_bookmark = false,
          custom = {},
          exclude = {},
        },
        live_filter = {
          prefix = "[FILTER]: ",
          always_show_folders = true,
        },
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
          ignore_dirs = {},
        },
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
          },
          expand_all = {
            max_folder_discovery = 300,
            exclude = {},
          },
          file_popup = {
            open_win_config = {
              col = 1,
              row = 1,
              relative = "cursor",
              border = "shadow",
              style = "minimal",
            },
          },
          open_file = {
            quit_on_open = true,
            eject = true,
            resize_window = true,
            window_picker = {
              enable = true,
              picker = "default",
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
          remove_file = {
            close_window = true,
          },
        },
        trash = {
          cmd = "gio trash",
        },
        tab = {
          sync = {
            open = false,
            close = false,
            ignore = {},
          },
        },
        notify = {
          threshold = vim.log.levels.INFO,
          absolute_path = true,
        },
        help = {
          sort_by = "key",
        },
        ui = {
          confirm = {
            remove = true,
            trash = true,
            default_yes = false,
          },
        },
        experimental = {
          actions = {
            open_file = {
              relative_path = false,
            },
          },
        },
        log = {
          enable = false,
          truncate = false,
          types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
          },
        },
      })
    end,
    keys = {
      { "<C-\\>", function() vim.cmd([[NvimTreeToggle]]) end,   mode = { "n", "t", "i", "v" },          desc = "Toggle nvim-tree" },
      { "<C-f>",  function() vim.cmd([[NvimTreeFindFile]]) end, desc = "Show current file in nvim-tree" },
      {
        "<leader>e",
        function()
          vim.cmd([[NvimTreeToggle]])
          vim.cmd([[NvimTreeCollapse]])
        end,
        mode = { "n", "t" },
        desc = "Toggle collapsed nvim-tree"
      },
    },
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'b0o/nvim-tree-preview.lua',
    },
  },
  {
    'nvim-lua/plenary.nvim',
  },
}
