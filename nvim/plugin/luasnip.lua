local status, lua_snip = pcall(require, "luasnip")
if not status then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
