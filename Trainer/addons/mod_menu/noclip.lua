-- NoClip mod
-- Author: Simplity

local update, update_position
local axis_move = { x = 0, y = 0 }
local kb = Input:keyboard()
local kb_down = kb.down
local zero_rot = Rotation(0, 0, 0)

local Idstring = Idstring
local M_player = managers.player
local speed = ppr_config.NoClipSpeed or 2

plugins:new_plugin('noclip')

CATEGORY = 'mods'

VERSION = '1.0'

update = function()
	axis_move.x = kb_down( kb, Idstring("w") ) and speed or kb_down( kb, Idstring("s") ) and -speed or 0
	axis_move.y = kb_down( kb, Idstring("d") ) and speed or kb_down( kb, Idstring("a") ) and -speed or 0
	update_position()
end

update_position = function()
	local player = M_player:player_unit()
	if not player then return end
	local cam_rot = player:camera():rotation()
	local move_dir = cam_rot:x() * axis_move.y + cam_rot:y() * axis_move.x
	local pos_new = player:position() + move_dir * 10
	M_player:warp_to( pos_new, cam_rot, 1, zero_rot )
end

--------------------------------------------------------------

function MAIN()
	RunNewLoopIdent('update_noclip', update)
end

function UNLOAD()
	StopLoopIdent('update_noclip')
end

FINALIZE()
