--  Authors:  Originally by baldwin, re-write by Davy Jones
--  Purpose:  Cooks meth on Rats and Cook-Off for you... infinitely.

local plugins = plugins
plugins:new_plugin('autocooker')

local alive = alive
local pairs = pairs
local type = type

local managers = managers
local M_interaction = managers.interaction
local M_player = managers.player

local backuper = backuper
local add_clbk = backuper.add_clbk
local remove_clbk = backuper.remove_clbk

local executewithdelay = executewithdelay

FULL_NAME = "Meth Auto-Cooker"

VERSION = "2.0"

DESCRIPTION = "Cooks and bags up meth for you.  Originally by baldwin, re-written by Davy Jones."

local _interactive_units = M_interaction._interactive_units
local _players = M_player._players
local needed_chem = {'methlab_bubbling', 'methlab_caustic_cooler', 'methlab_gas_to_salt'}


local function true_func()
	return true
end

local function cook_meth(chemical)
	local player = _players[1]
	if alive(player) then
		local interaction
		local found_unit
		if type(chemical) == 'string' then
			for _, unit in pairs(_interactive_units) do
				if alive(unit) then
					local inter = unit:interaction()
					if inter and inter.tweak_data == chemical then
						interaction = inter
						found_unit = unit
						break
					end
				end
			end
		end
		-- guard: unit may be freed between find and interact → access violation if not checked
		if interaction and found_unit and alive(found_unit) then
			interaction.can_interact = true_func
			interaction:interact(player)
		end
	end
end

function MAIN()
	add_clbk(backuper, 'DialogManager.queue_dialog', function(o, self, id)
		if id == 'pln_rt1_20' then
			cook_meth(needed_chem[1])
		elseif id == 'pln_rt1_22' then
			cook_meth(needed_chem[2])
		elseif id == 'pln_rt1_24' then
			cook_meth(needed_chem[3])
		end
	end, 'chemical_hook', 1)
	add_clbk(backuper, 'ObjectInteractionManager.add_unit', function(o, self, unit)
		executewithdelay(function()
			local interaction = alive(unit) and unit:interaction()
			if interaction and interaction.tweak_data == 'taking_meth' then
				interaction:interact(_players[1])
			end
		end, 0.4)
	end, 'bag_meth_hook', 2)
end

function UNLOAD()
	remove_clbk(backuper, 'DialogManager.queue_dialog', 'chemical_hook', 1)
	remove_clbk(backuper, 'ObjectInteractionManager.add_unit', 'bag_meth_hook', 2)
end

FINALIZE()