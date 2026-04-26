local function get_system_theme()
  local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
  if not handle then
    return "dark"
  end

  local result = handle:read("*a")
  handle:close()

  if result:match("default") then
    return "day"
  end

  return "night"
end

local style = get_system_theme()

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = style,
    },
  },
}
