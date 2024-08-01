local default_light = "peachpuff"
-- local default_light = "rose-pine-dawn"
-- local default_dark = "yellow-moon"
local default_dark = "rose-pine-main"

local get_time_of_day = function()
  local hour = tonumber(os.date("%H"))
  if hour >= 6 and hour < 12 then
    return "morning"
  elseif hour >= 12 and hour < 18 then
    return "afternoon"
  elseif hour >= 18 and hour < 24 then
    return "evening"
  else
    return "night"
  end
end
local get_colorscheme = function(a)
  if a == "random" then
    math.randomseed(os.time())
    math.random(); math.random(); math.random();
    local random = math.ceil((math.random(0.1, 1.9) / 2)) - 1;
    vim.notify_once("[Random colorscheme]: random = " .. random .. " - " .. (random == 1 and "light" or "dark"))

    if random == 1 then return default_light end
    if random == 0 then return default_dark end
    return "default"
  else
    if a == "tod" then
      local tod = get_time_of_day()
      if (tod == "morning") or (tod == "afternoon") then
        vim.notify_once("Good " .. tod .. " Mar! colorscheme auto set to: " .. default_light)
        return default_light
      end
      if (tod == "evening") or (tod == "night") then
        vim.notify_once("Good " .. tod .. " Mar! colorscheme auto set to: " .. default_dark)
        return default_dark
      end
    end
  end
end;
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
      colorscheme = get_colorscheme("tod")
    },
    keys = {
      -- { "<C-M>d",     function() vim.cmd("colorscheme " .. default_dark) end,  mode = { "n", "t" }, desc = "Set to default dark mode theme." },
      { "<leader>Md", function() vim.cmd("colorscheme " .. default_dark) end,  mode = { "n", "t" }, desc = "Set to default dark mode theme." },
      -- { "<C-M>l",     function() vim.cmd("colorscheme " .. default_light) end, mode = { "n", "t" }, desc = "Set to default light mode theme." },
      { "<leader>Ml", function() vim.cmd("colorscheme " .. default_light) end, mode = { "n", "t" }, desc = "Set to default light mode theme." },

    },
  },
}
