data.motrans = true

require("prototypes.boat")

--[[
data.raw["tile"]["water"].collision_mask={
	"water-tile",
	"item-layer",
	"resource-layer",
	"doodad-layer"
}]]

--Lets change all the rails so they can run over water.
local Items = data.raw["rail"]
local Data = {"object-layer"}
for i,d in pairs(Items) do
	d.collision_mask=Data
end

--[[local Items = data.raw["wall"]
local Data = {"object-layer","player-layer"}
for i,d in pairs(Items) do
	d.collision_mask=Data
end]]
