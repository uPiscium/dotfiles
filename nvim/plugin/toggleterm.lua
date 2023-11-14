local status, toggleterm = pcall(require, "toggleterm.terminal")
if not status then
  return
end

local Terminal = toggleterm.Terminal
local tig = Terminal:new({ cmd = "tig", hidden = true, direction = "float" })

function tig_toggle()
  tig:toggle()
end
