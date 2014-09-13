data:extend(
{
 {
    type = "container",
    name = "combat-roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "combat-roboport"},
	order="a",
	subgroup="drone-combat",
    max_health = 600,
	dying_explosion = "huge-explosion",
    corpse = "big-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    inventory_size = 6,
    picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base.png",
      width = 143,
      height = 135,
      shift = {0.5, 0.25}
    }
  },
  {
    type = "item",
    name = "combat-roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"goes-to-quickbar"},
	order="a",
	subgroup="drone-combat",
    place_result = "combat-roboport",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "combat-roboport",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 40},
      {"electronic-circuit", 20},
	  {"processing-unit", 10},
	  {"medium-electric-pole",2}
    },
    result = "forcefield-post"
  }
}
)