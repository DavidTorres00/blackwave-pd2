-- Infinite battery in ecm
-- Author: Simplity

local backuper = backuper
local backup = backuper.backup
local restore = backuper.restore
local m_log_error = m_log_error

local ECMJammerBase = ECMJammerBase

plugins:new_plugin('inf_battery_activated')

VERSION = '1.0'

local _active_jammers = {}

function MAIN()
	_active_jammers = {}
	backup(backuper, 'ECMJammerBase.update')
	m_log_error("inf_battery MAIN", "hooked - infinite battery active")

	function ECMJammerBase:update()
		_active_jammers[self] = true
		self._battery_life = self._max_battery_life
	end
end

function UNLOAD()
	restore(backuper, 'ECMJammerBase.update')
	local count = 0
	for jammer in pairs(_active_jammers) do
		ECMJammerBase.set_battery_empty(jammer)
		count = count + 1
	end
	m_log_error("inf_battery UNLOAD", "restored - emptied=" .. count)
	_active_jammers = {}
end

FINALIZE()
