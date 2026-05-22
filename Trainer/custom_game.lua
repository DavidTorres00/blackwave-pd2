--Purpose: Your own Scripts for In-Game go below this line --

local cfg = ppr_config

-- Force GC: frees leftover menu/lobby memory at heist start
if cfg.ForceGCOnGameStart then
	collectgarbage("collect")
end

-- FSS throughput cap: FSS defaults to 600 which causes OOM crashes with fire/bags.
-- This overrides it right after FSS sets it, keeping AI active but within safe limits.
if cfg.FSSMaxThroughput and FullSpeedSwarm and FullSpeedSwarm.apply_max_task_throughput then
	FullSpeedSwarm:apply_max_task_throughput(cfg.FSSMaxThroughput)
end
