-- Purpose: pregame/ingame menu theme color selector (F4)

local ppr_require = ppr_require
ppr_require 'Trainer/tools/new_menu/menu'

local Menu   = Menu
local cfg    = ppr_config
local insert = table.insert
local tr     = Localization.translate

local THEMES = {
	{ key = "cyan",   label = "Cyan",      color = Color.cyan       },
	{ key = "gold",   label = "Gold",       color = Color.gold       },
	{ key = "green",  label = "Neon Green", color = Color.neongreen  },
	{ key = "purple", label = "Purple",     color = Color.Patron     },
	{ key = "red",    label = "Red",        color = Color.red        },
	{ key = "pink",   label = "Pink",       color = Color.pink       },
	{ key = "white",  label = "White",      color = Color.white      },
	{ key = "orange", label = "Orange",     color = Color.MENU_EQUIP },
	{ key = "lilac",  label = "Lilac",      color = Color.lila       },
	{ key = "teal",   label = "Teal",       color = Color.bluegreen  },
}

local KEY_TO_COLOR = {}
for _, t in ipairs(THEMES) do KEY_TO_COLOR[t.key] = t.color end

local main, pregame_menu, ingame_menu

local function apply_pregame(key)
	Color.MENU_THEME = KEY_TO_COLOR[key] or Color.cyan
	cfg.MenuTheme    = key
	cfg()
	pregame_menu()
end

local function apply_ingame(key)
	Color.INGAME_THEME = key ~= "category" and KEY_TO_COLOR[key] or nil
	cfg.IngameTheme    = key ~= "category" and key or nil
	cfg()
	ingame_menu()
end

local function build_theme_buttons(cur, callback)
	local data = {}
	for _, t in ipairs(THEMES) do
		local key = t.key
		insert(data, {
			text     = t.label,
			type     = "toggle",
			toggle   = function() return cur == key end,
			callback = callback,
			data     = key,
		})
	end
	return data
end

pregame_menu = function()
	local cur  = cfg.MenuTheme or "cyan"
	local data = build_theme_buttons(cur, apply_pregame)
	Menu:open({ title = tr.theme_pregame, color = Color.MENU_THEME, button_list = data, back = main })
end

ingame_menu = function()
	local cur  = cfg.IngameTheme or "category"
	local data = {
		{
			text     = tr.theme_per_category,
			type     = "toggle",
			toggle   = function() return cur == "category" end,
			callback = apply_ingame,
			data     = "category",
		},
		{},
	}
	for _, btn in ipairs(build_theme_buttons(cur, apply_ingame)) do
		insert(data, btn)
	end
	Menu:open({ title = tr.theme_ingame, color = Color.MENU_THEME, button_list = data, back = main })
end

main = function()
	local data = {
		{ text = tr.theme_pregame, callback = pregame_menu, menu = true },
		{ text = tr.theme_ingame,  callback = ingame_menu,  menu = true },
	}
	Menu:open({ title = tr.theme_menu_title, color = Color.MENU_THEME, button_list = data })
end

return main
