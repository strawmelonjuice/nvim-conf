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
        -- auto_close = true, no longer works
        view = {
          side = 'right',
          width = 30
        },

        actions = {
          open_file = {
            -- resize_window = false,
          },
        },
      })
    end,
    keys = {
      { "<C-\\>",    function() vim.cmd([[NvimTreeToggle]]) end,   mode = { "n", "t" },                    desc = "Toggle nvim-tree" },
      { "<C-f>",     function() vim.cmd([[NvimTreeFindFile]]) end, desc = "Show current file in nvim-tree" },
      { "<leader>e", function() vim.cmd([[NvimTreeToggle]]) end,   mode = { "n", "t" },                    desc = "Toggle nvim-tree" },
    },
  },
}
