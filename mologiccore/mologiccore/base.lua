--[[--------------------------------------------------------------------
___  ___      _                 _      _____                
|  \/  |     | |               (_)    /  __ \               
| .  . | ___ | |     ___   __ _ _  ___| /  \/ ___  _ __ ___ 
| |\/| |/ _ \| |    / _ \ / _` | |/ __| |    / _ \| '__/ _ \
| |  | | (_) | |___| (_) | (_| | | (__| \__/\ (_) | | |  __/
\_|  |_/\___/\_____/\___/ \__, |_|\___|\____/\___/|_|  \___|
                           __/ |                            
                          |___/                             
------------------------------------------------------------------------
MoLogicCore was develped by Ludsoe, you may use and modify the code in
MoLogicCore to your hearts content. Please provide info below if you 
modify and redistribute this folder and its contents.
------------------------------------------------------------------------ 
This Version of MoLogicCore is: 
Version: UnModdified
Author: Ludsoe
ExtraInfo: None
--]]--------------------------------------------------------------------

require "util"
require "defines"

local MLCDataVers = 1.45
local LastCompatable = 1.38
IsLoaded = false

--This automaticly sorts all the functions into their respective tables.
function FuncRegister(Name,Function)
	local Table=GetTable()
	Table[Name]=Function
end
function GetTable() end

--Due to the save system of factorio being wierd, Im forced to use a hack workaround to save MoLogicCores data properly.
local STables = {}
function RegisterSaveTable(Name,Table,Func,Over)
	STables[Name]={N=Name,T=Table,O=Over,F=Func}
end

if MLC == nil then
	game.showmessagedialog("Warning, MoLogicCore Loaded without a setup table!")
else	
	--If timer core is enabled use it instead.
	MLCSaveFix = function() if not IsLoaded then MoSave() end end
	
	if MLC.Debug then
		require "scripts.debug"
	end
	if MLC.Math then
		require "scripts.math"
	end
	if MLC.Timers then
		require "scripts.timer"
	end
	if MLC.Misc then
		require "scripts.misc"
	end
	if MLC.Entity then
		require "scripts.entity"
	end
end

function TableCopy(Table)
	local NewTable = {}
	for i,d in pairs(Table) do
		local T = type(d)
		if T=="Table" then
			NewTable[i]=TableCopy(d)
		else
			NewTable[i]=d
		end
	end
	return NewTable
end

return function()
	if glob.MoLogicCore == nil or glob.MoLogicCore.Vers<LastCompatable then glob.MoLogicCore = {Vers = MLCDataVers} end
	for i,d in pairs(STables) do
		if glob.MoLogicCore[d.N] == nil then
			glob.MoLogicCore[d.N]=d.T
			--if MLC.Debug then Debug.Print("Data Tables Created") end
		else
			d.F(TableCopy(glob.MoLogicCore[d.N]))
			glob.MoLogicCore[d.N]=d.T
			--if MLC.Debug then Debug.Print("Save Loaded") end
		end
	end	
	IsLoaded=true
end
