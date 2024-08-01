-- local default_light = "peachpuff"
local default_light = "rose-pine-dawn"
-- local default_dark = "yellow-moon"
local default_dark = "rose-pine-moon"
local get_default_random = function()
  math.randomseed(os.time())
  math.random(); math.random(); math.random();
  local random = math.ceil((math.random(0.1, 1.9) / 2)) - 1;

  vim.notify_once("[Random colorscheme]: random = " .. random .. " - " .. (random == 1 and "light" or "dark"))
  if random == 1 then return default_light end
  if random == 0 then return default_dark end
  return "default"
end;
local default_random = get_default_random()
return {
  { "rose-pine/neovim",        name = "rose-pine" },
  { "catppuccin/nvim",         name = "catppuccin" },
  { "EdenEast/nightfox.nvim" },
  { "tanvirtin/monokai.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "sts10/vim-pink-moon" },
  { "rktjmp/lush.nvim" },
  { "Scysta/pink-panic.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = default_random },
    keys = {
      -- { "<C-M>d",     function() vim.cmd("colorscheme " .. default_dark) end,  mode = { "n", "t" }, desc = "Set to default dark mode theme." },
      { "<leader>Md", function() vim.cmd("colorscheme " .. default_dark) end,  mode = { "n", "t" }, desc = "Set to default dark mode theme." },
      -- { "<C-M>l",     function() vim.cmd("colorscheme " .. default_light) end, mode = { "n", "t" }, desc = "Set to default light mode theme." },
      { "<leader>Ml", function() vim.cmd("colorscheme " .. default_light) end, mode = { "n", "t" }, desc = "Set to default light mode theme." },

    },
  },
}
