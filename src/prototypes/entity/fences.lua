-- Imports
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

-- Merge Group Reservations
local wooden_fence_merge_group = 24

-- Remnant Corpse Definitions
data:extend({
    {
        type = "corpse",
        name = "wooden-fence-remnants",
        localised_name = {"remnant-name", {"entity-name.wooden-fence"}},
        icon = "__ffences__/graphics/icons/wooden-fence.png",
        hidden_in_factoriopedia = true,
        flags = {"placeable-neutral", "not-on-map"},
        subgroup = "defensive-structure-remnants",
        order = "a-a-a",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        tile_width = 1,
        tile_height = 1,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 5, -- 5 minutes
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        -- todo: update from wall
        animation = make_rotated_animation_variations_from_sheet(4, {
            filename = "__ffences__/graphics/entity/wooden-fence/remnants/wooden-fence-remnants.png",
            width = 118,
            height = 114,
            line_length = 1,
            direction_count = 2,
            shift = util.by_pixel(3, 7.5), --was 3.5
            scale = 0.5
        })
    }
})

-- Fence Wall Definitions
data:extend({
    {
        type = "wall",
        name = "wooden-fence",
        icon = "__ffences__/graphics/icons/wooden-fence.png",
        flags = {"placeable-neutral", "player-creation"},
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        minable = {mining_time = 0.125, result = "wooden-fence"},
        fast_replaceable_group = "wall",
        max_health = 15,
        corpse = "wooden-fence-remnants",
        dying_explosion = "wooden-chest-explosion",
        repair_sound = sounds.manual_repair,
        mined_sound = sounds.tree_mined,
        open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
        close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
        impact_category = "wood",
        connected_gate_visualization = {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        resistances = {
            {
                type = "physical",
                decrease = 1,
                percent = 5
            },
            {
                type = "impact",
                decrease = 2,
                percent = 5
            }
        },
        visual_merge_group = wooden_fence_merge_group,
        pictures = {
            single = {
                layers = {
                    {
                        filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-single.png",
                        priority = "extra-high",
                        width = 64,
                        height = 86,
                        variation_count = 1,
                        line_length = 1,
                        shift = util.by_pixel(0, -5),
                        scale = 0.5
                    },
                    {
                        filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-single-shadow.png",
                        priority = "extra-high",
                        width = 98,
                        height = 60,
                        repeat_count = 1,
                        shift = util.by_pixel(20, 25),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        }
    },
    {
        type = "wall",
        name = "iron-fence",
        icon = "__base__/graphics/icons/wall.png",
        flags = {"placeable-neutral", "player-creation"},
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.wall(),
        minable = {mining_time = 0.2, result = "iron-fence"},
        fast_replaceable_group = "wall",
        max_health = 200,
        repair_speed_modifier = 2,
        corpse = "wall-remnants",
        dying_explosion = "wall-explosion",
        repair_sound = sounds.manual_repair,
        mined_sound = sounds.deconstruct_bricks(0.8),
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        impact_category = "stone",
        connected_gate_visualization = {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 64,
            height = 64,
            scale = 0.5
        },
        resistances = {
            {
                type = "physical",
                decrease = 3,
                percent = 20
            },
            {
                type = "impact",
                decrease = 45,
                percent = 60
            },
            {
                type = "explosion",
                decrease = 10,
                percent = 30
            },
            {
                type = "fire",
                percent = 100
            },
            {
                type = "acid",
                percent = 80
            },
            {
                type = "laser",
                percent = 70
            }
        },
        visual_merge_group = 42,
        pictures = {
            single = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-single.png",
                        priority = "extra-high",
                        width = 64,
                        height = 86,
                        variation_count = 2,
                        line_length = 2,
                        shift = util.by_pixel(0, -5),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-single-shadow.png",
                        priority = "extra-high",
                        width = 98,
                        height = 60,
                        repeat_count = 2,
                        shift = util.by_pixel(10, 17),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            straight_vertical = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-vertical.png",
                        priority = "extra-high",
                        width = 64,
                        height = 134,
                        variation_count = 5,
                        line_length = 5,
                        shift = util.by_pixel(0, 8),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-vertical-shadow.png",
                        priority = "extra-high",
                        width = 98,
                        height = 110,
                        repeat_count = 5,
                        shift = util.by_pixel(10, 29),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            straight_horizontal = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-horizontal.png",
                        priority = "extra-high",
                        width = 64,
                        height = 92,
                        variation_count = 6,
                        line_length = 6,
                        shift = util.by_pixel(0, -2),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-horizontal-shadow.png",
                        priority = "extra-high",
                        width = 124,
                        height = 68,
                        repeat_count = 6,
                        shift = util.by_pixel(14, 15),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            corner_right_down = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-corner-right.png",
                        priority = "extra-high",
                        width = 64,
                        height = 128,
                        variation_count = 2,
                        line_length = 2,
                        shift = util.by_pixel(0, 7),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-corner-right-shadow.png",
                        priority = "extra-high",
                        width = 124,
                        height = 120,
                        repeat_count = 2,
                        shift = util.by_pixel(17, 28),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            corner_left_down = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-corner-left.png",
                        priority = "extra-high",
                        width = 64,
                        height = 134,
                        variation_count = 2,
                        line_length = 2,
                        shift = util.by_pixel(0, 7),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-corner-left-shadow.png",
                        priority = "extra-high",
                        width = 102,
                        height = 120,
                        repeat_count = 2,
                        shift = util.by_pixel(9, 28),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            t_up = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-t.png",
                        priority = "extra-high",
                        width = 64,
                        height = 134,
                        variation_count = 4,
                        line_length = 4,
                        shift = util.by_pixel(0, 7),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-t-shadow.png",
                        priority = "extra-high",
                        width = 124,
                        height = 120,
                        repeat_count = 4,
                        shift = util.by_pixel(14, 28),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            ending_right = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-ending-right.png",
                        priority = "extra-high",
                        width = 64,
                        height = 92,
                        variation_count = 2,
                        line_length = 2,
                        shift = util.by_pixel(0, -3),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-ending-right-shadow.png",
                        priority = "extra-high",
                        width = 124,
                        height = 68,
                        repeat_count = 2,
                        shift = util.by_pixel(17, 15),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            ending_left = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-ending-left.png",
                        priority = "extra-high",
                        width = 64,
                        height = 92,
                        variation_count = 2,
                        line_length = 2,
                        shift = util.by_pixel(0, -3),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-ending-left-shadow.png",
                        priority = "extra-high",
                        width = 102,
                        height = 68,
                        repeat_count = 2,
                        shift = util.by_pixel(9, 15),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            filling = {
                filename = "__base__/graphics/entity/wall/wall-filling.png",
                priority = "extra-high",
                width = 48,
                height = 56,
                variation_count = 8,
                line_length = 8,
                shift = util.by_pixel(0, -1),
                scale = 0.5
            },
            water_connection_patch = {
                sheets = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-patch.png",
                        priority = "extra-high",
                        width = 116,
                        height = 128,
                        shift = util.by_pixel(0, -2),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-patch-shadow.png",
                        priority = "extra-high",
                        width = 144,
                        height = 100,
                        shift = util.by_pixel(9, 15),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            },
            gate_connection_patch = {
                sheets = {
                    {
                        filename = "__base__/graphics/entity/wall/wall-gate.png",
                        priority = "extra-high",
                        width = 82,
                        height = 108,
                        shift = util.by_pixel(0, -7),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/wall/wall-gate-shadow.png",
                        priority = "extra-high",
                        width = 130,
                        height = 78,
                        shift = util.by_pixel(14, 18),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
    }
})