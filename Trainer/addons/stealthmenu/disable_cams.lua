-- Disable cameras
-- Author: Simplity, Original: ?

local pairs = pairs
local m_log_error = m_log_error

plugins:new_plugin('disable_cams')

VERSION = '1.0'

function MAIN()
	local count = 0
	for _,unit in pairs( SecurityCamera.cameras ) do
		if unit:base()._last_detect_t ~= nil then
			unit:base():set_update_enabled( false )
			count = count + 1
		end
	end
	m_log_error("disable_cams MAIN", "disabled=" .. count)
end

function UNLOAD()
	local count = 0
	for _,unit in pairs( SecurityCamera.cameras ) do
		if unit:base()._last_detect_t ~= nil then
			unit:base():set_update_enabled( true )
			count = count + 1
		end
	end
	m_log_error("disable_cams UNLOAD", "re-enabled=" .. count)
end

FINALIZE()
