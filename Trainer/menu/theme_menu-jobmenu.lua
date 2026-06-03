-- F4 dispatcher: theme selector in pregame, job/stealth menu ingame
if GameSetup then
	return ppr_dofile('Trainer/menu/jobmenu-stealthmenu.lua')
else
	return ppr_dofile('Trainer/menu/theme_menu.lua')
end
