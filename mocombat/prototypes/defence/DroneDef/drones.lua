data:extend(
{
	{
		type = "unit",
		name = "attack-drone",
		icon = "__base__/graphics/icons/logistic-robot.png",
		flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
		max_health = 120,
		order="c",
		subgroup="drone-combat",
		healing_per_tick = 0.01,
		collision_mask = {"ghost-layer"},
		collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
		attack_parameters =
		{
			ammo_category = "combat-robot-laser",
			cooldown = 20,
			damage_modifier = 0.7,
			projectile_center = {0, 0},
			projectile_creation_distance = 0.6,
			range = 15,
			ammo_type =
			{
				category = "combat-robot-laser",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "laser",
						starting_speed = 0.3
					}
				}
			},
			sound =
			{
				{
				  filename = "__base__/sound/laser.ogg",
				  volume = 0.4
				}
			},
			animation =
			{
				filename = "__base__/graphics/entity/combat-robot/distractor.png",
				priority = "high",
				still_frame = 1,
				frame_width = 37,
				frame_height = 34,
				frame_count = 1,
				direction_count = 1,
				shift = {0, 0}
			}
		},
		vision_distance = 30,
		movement_speed = 0.2,
		distance_per_frame = 0.1,
		pollution_to_join_attack = 20000000,
		distraction_cooldown = 300,
		corpse = "small-remnants",
		destroy_action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
				type = "create-entity",
				entity_name = "explosion"
			}
		  }
		},
		run_animation =
		{
			filename = "__base__/graphics/entity/combat-robot/distractor.png",
			still_frame = 1,
			frame_width = 37,
			frame_height = 34,
			frame_count = 1,
			priority = "high",
			direction_count = 1,
			shift = {0, 0}
		}
	},
  {
    type = "item",
    name = "attack-drone",
	icon = "__base__/graphics/icons/distractor.png",
    flags = {"goes-to-quickbar"},
	order="c",
	subgroup="drone-combat",
    place_result = "combat-roboport",
    stack_size = 20
  },
  {
    type = "recipe",
    name = "attack-drone",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"distractor-capsule", 4},
	  {"flying-robot-frame", 1}
    },
    result = "attack-drone"
  }
}
)