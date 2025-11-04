local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")


--[[
    Merge group reservations.
--]]
local wooden_fence_merge_group = 24
local iron_fence_merge_group = 25
local steel_fence_merge_group = 26


--[[
    Remnants prototype definitions.
--]]
data:extend({
    {
        -- Prototype
        name= "wooden-fence-remnants",
        order = "a-a-a",
        subgroup = "defensive-structure-remnants",
        type = "corpse",

        -- EntityPrototype
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        flags = {"placeable-neutral", "not-on-map"},
        hidden_in_factoriopedia = true,
        icon = "__ffences__/graphics/icons/wooden-fence.png",
        localised_name = {"remnant-name", {"entity-name.wooden-fence"}},
        selectable_in_game = false,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

        -- CorpsePrototype
        animation = make_rotated_animation_variations_from_sheet(4, {
            filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-remnants.png",
            width = 118,
            height = 118,
            line_length = 1,
            direction_count = 1,
            shift = util.by_pixel(3, 7.5),
            scale = 0.5
        }),
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        time_before_removed = 60 * 60 * 2, -- 2 minutes
    },
    {
        -- Prototype
        name= "iron-fence-remnants",
        order = "a-a-a",
        subgroup = "defensive-structure-remnants",
        type = "corpse",

        -- EntityPrototype
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        flags = {"placeable-neutral", "not-on-map"},
        hidden_in_factoriopedia = true,
        icon = "__ffences__/graphics/icons/iron-fence.png",
        localised_name = {"remnant-name", {"entity-name.iron-fence"}},
        selectable_in_game = false,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

        -- CorpsePrototype
        animation = make_rotated_animation_variations_from_sheet(4, {
            filename = "__ffences__/graphics/entity/iron-fence/iron-fence-remnants.png",
            width = 118,
            height = 118,
            line_length = 1,
            direction_count = 1,
            shift = util.by_pixel(3, 7.5),
            scale = 0.8
        }),
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        time_before_removed = 60 * 60 * 5, -- 5 minutes
    }
})


--[[
    Wall prototype definitions.
--]]
data:extend({
    {
        -- Prototype
        name = "wooden-fence",
        type = "wall",

        -- EntityPrototype
        close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        fast_replaceable_group = "wall",
        flags = {"placeable-neutral", "player-creation"},
        icon = "__ffences__/graphics/icons/wooden-fence.png",
        impact_category = "wood",
        minable = { mining_time = 0.125, result = "wooden-fence" },
        mined_sound = sounds.tree_mined,
        open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume = 0.6 },
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

        -- EntityWithHealthPrototype
        corpse = "wooden-fence-remnants",
        damaged_trigger_effect = hit_effects.entity(),
        dying_explosion = "wooden-chest-explosion",
        max_health = 15,
        repair_sound = sounds.manual_repair,
        resistances = {
            { type = "physical", decrease = 1, percent = 5 },
            { type = "impact", decrease = 15, percent = 8 }
        },

        -- WallPrototype
        connected_gate_visualization = {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 64,
            height = 64,
            scale = 0.5,
        },
        pictures = {
            single = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-single.png",
                    priority = "extra-high",
                    width = 18,
                    height = 76,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, -4),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-single-shadow.png",
                    priority = "extra-high",
                    width = 86,
                    height = 57,
                    repeat_count = 5,
                    shift = util.by_pixel(16.80, 24.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            straight_vertical = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-vertical.png",
                    priority = "extra-high",
                    width = 18,
                    height = 123,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, 7.75),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-vertical-shadow.png",
                    priority = "extra-high",
                    width = 86,
                    height = 101,
                    repeat_count = 5,
                    shift = util.by_pixel(17.72, 33.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            straight_horizontal = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-horizontal.png",
                    priority = "extra-high",
                    width = 66,
                    height = 78,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, -3.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-horizontal-shadow.png",
                    priority = "extra-high",
                    width = 122,
                    height = 60,
                    repeat_count = 5,
                    shift = util.by_pixel(14.64, 24),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            ending_right = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-ending-right.png",
                    priority = "extra-high",
                    width = 43,
                    height = 77,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(5.25, -4),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-ending-right-shadow.png",
                    priority = "extra-high",
                    width = 103,
                    height = 60,
                    repeat_count = 5,
                    shift = util.by_pixel(20.97, 24.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            ending_left = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-ending-left.png",
                    priority = "extra-high",
                    width = 43,
                    height = 77,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(-5.25, -4),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-ending-left-shadow.png",
                    priority = "extra-high",
                    width = 108,
                    height = 60,
                    repeat_count = 5,
                    shift = util.by_pixel(10.71, 24.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_right_down = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-corner-right.png",
                    priority = "extra-high",
                    width = 43,
                    height = 123,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(5.25, 7.75),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-corner-right-shadow.png",
                    priority = "extra-high",
                    width = 102,
                    height = 101,
                    repeat_count = 5,
                    shift = util.by_pixel(21.72, 34.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_left_down = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-corner-left.png",
                    priority = "extra-high",
                    width = 43,
                    height = 123,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(-5.25, 7.75),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-corner-left-shadow.png",
                    priority = "extra-high",
                    width = 108,
                    height = 101,
                    repeat_count = 5,
                    shift = util.by_pixel(11, 34),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_right_up = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-corner-right-up.png",
                    priority = "extra-high",
                    width = 44,
                    height = 122,
                    variation_count = 1,
                    line_length = 1,
                    shift = util.by_pixel(5, -14.5),
                    scale = 0.5
                }}
            },
            t_up = {
                layers = {{
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-t-up.png",
                    priority = "extra-high",
                    width = 64,
                    height = 123,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, 7),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/wooden-fence/wooden-fence-t-up-shadow.png",
                    priority = "extra-high",
                    width = 124,
                    height = 101,
                    repeat_count = 5,
                    shift = util.by_pixel(14.56, 33.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            }
        },
        visual_merge_group = wooden_fence_merge_group

    },
    {
        -- Prototype
        name = "iron-fence",
        type = "wall",

        -- EntityPrototype
        close_sound = sounds.metallic_chest_close,
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        fast_replaceable_group = "wall",
        flags = {"placeable-neutral", "player-creation"},
        icon = "__ffences__/graphics/icons/iron-fence.png",
        impact_category = "metal",
        minable = { mining_time = 0.1675, result = "iron-fence" },
        mined_sound = sounds.deconstruct_small(0.8),
        open_sound = sounds.metallic_chest_open,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

        -- EntityWithHealthPrototype
        corpse = "iron-fence-remnants",
        damaged_trigger_effect = hit_effects.entity(),
        dying_explosion = "iron-chest-explosion",
        max_health = 55,
        repair_sound = sounds.manual_repair,
        resistances = {
            { type = "physical", decrease = 2, percent = 5 },
            { type = "impact", decrease = 10, percent = 5 },
            { type = "fire", percent = 100 },
            { type = "acid", percent = 15 },
            { type = "explosion", decrease = 2, percent = 10 },
            { type = "laser", percent = 10 }
        },

        -- WallPrototype
        connected_gate_visualization = {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 64,
            height = 64,
            scale = 0.5,
        },
        pictures = {
            single = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-single.png",
                    priority = "extra-high",
                    width = 15,
                    height = 92,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, -5),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-single-shadow.png",
                    priority = "extra-high",
                    width = 103,
                    height = 73,
                    repeat_count = 5,
                    shift = util.by_pixel(22.60, 31.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            straight_vertical = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-vertical.png",
                    priority = "extra-high",
                    width = 4,
                    height = 154,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, 7.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-vertical-shadow.png",
                    priority = "extra-high",
                    width = 79,
                    height = 118,
                    repeat_count = 5,
                    shift = util.by_pixel(19.12, 40.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            straight_horizontal = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-horizontal.png",
                    priority = "extra-high",
                    width = 66,
                    height = 72,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, -2),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-horizontal-shadow.png",
                    priority = "extra-high",
                    width = 143,
                    height = 54,
                    repeat_count = 5,
                    shift = util.by_pixel(20.14, 28.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            ending_right = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-ending-right.png",
                    priority = "extra-high",
                    width = 38,
                    height = 92,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(6, -5),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-ending-right-shadow.png",
                    priority = "extra-high",
                    width = 111,
                    height = 73,
                    repeat_count = 5,
                    shift = util.by_pixel(25.02, 31.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            ending_left = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-ending-left.png",
                    priority = "extra-high",
                    width = 38,
                    height = 92,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(-6, -5),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-ending-left-shadow.png",
                    priority = "extra-high",
                    width = 122,
                    height = 73,
                    repeat_count = 5,
                    shift = util.by_pixel(19.27, 31.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_right_down = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-corner-right.png",
                    priority = "extra-high",
                    width = 42,
                    height = 138,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(6, 6.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-corner-right-shadow.png",
                    priority = "extra-high",
                    width = 116,
                    height = 111,
                    repeat_count = 5,
                    shift = util.by_pixel(26.02, 40.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_left_down = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-corner-left.png",
                    priority = "extra-high",
                    width = 42,
                    height = 138,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(-6, 5.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-corner-left-shadow.png",
                    priority = "extra-high",
                    width = 126,
                    height = 111,
                    repeat_count = 5,
                    shift = util.by_pixel(17.68, 40.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            t_up = {
                layers = {{
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-t-up.png",
                    priority = "extra-high",
                    width = 61,
                    height = 138,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, 5.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/iron-fence/iron-fence-t-up-shadow.png",
                    priority = "extra-high",
                    width = 131,
                    height = 110,
                    repeat_count = 5,
                    shift = util.by_pixel(19.94, 40.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            }
        },
        visual_merge_group = iron_fence_merge_group
    },
    {
        -- Prototype
        name = "steel-fence",
        type = "wall",

        -- EntityPrototype
        close_sound = sounds.metallic_chest_close,
        collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
        fast_replaceable_group = "wall",
        flags = {"placeable-neutral", "player-creation"},
        icon = "__ffences__/graphics/icons/steel-fence.png",
        impact_category = "metal",
        minable = { mining_time = 0.1675, result = "steel-fence" },
        mined_sound = sounds.deconstruct_medium(0.8),
        open_sound = sounds.metallic_chest_open,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

        -- EntityWithHealthPrototype
        corpse = "iron-fence-remnants", -- TODO: update
        damaged_trigger_effect = hit_effects.entity(),
        dying_explosion = "iron-chest-explosion",
        max_health = 125,
        repair_sound = sounds.manual_repair,
        resistances = {
            { type = "physical", decrease = 4, percent = 12 },
            { type = "impact", decrease = 10, percent = 5 },
            { type = "fire", percent = 100 },
            { type = "acid", percent = 85 },
            { type = "explosion", decrease = 15, percent = 18 },
            { type = "laser", percent = 12 }
        },

        -- WallPrototype
        connected_gate_visualization = {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 64,
            height = 64,
            scale = 0.5,
        },
        pictures = {
            single = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-single.png",
                    priority = "extra-high",
                    width = 15,
                    height = 92,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, -5),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-single-shadow.png",
                    priority = "extra-high",
                    width = 103,
                    height = 73,
                    repeat_count = 5,
                    shift = util.by_pixel(22.60, 31.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            straight_vertical = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-vertical.png",
                    priority = "extra-high",
                    width = 4,
                    height = 154,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, 7.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-vertical-shadow.png",
                    priority = "extra-high",
                    width = 79,
                    height = 118,
                    repeat_count = 5,
                    shift = util.by_pixel(19.12, 40.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            straight_horizontal = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-horizontal.png",
                    priority = "extra-high",
                    width = 66,
                    height = 72,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, -2),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-horizontal-shadow.png",
                    priority = "extra-high",
                    width = 143,
                    height = 54,
                    repeat_count = 5,
                    shift = util.by_pixel(20.14, 28.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            ending_right = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-ending-right.png",
                    priority = "extra-high",
                    width = 38,
                    height = 92,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(6, -5),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-ending-right-shadow.png",
                    priority = "extra-high",
                    width = 111,
                    height = 73,
                    repeat_count = 5,
                    shift = util.by_pixel(25.02, 31.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            ending_left = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-ending-left.png",
                    priority = "extra-high",
                    width = 38,
                    height = 92,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(-6, -5),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-ending-left-shadow.png",
                    priority = "extra-high",
                    width = 122,
                    height = 73,
                    repeat_count = 5,
                    shift = util.by_pixel(19.27, 31.25),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_right_down = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-corner-right.png",
                    priority = "extra-high",
                    width = 42,
                    height = 138,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(6, 6.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-corner-right-shadow.png",
                    priority = "extra-high",
                    width = 116,
                    height = 111,
                    repeat_count = 5,
                    shift = util.by_pixel(26.02, 40.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            corner_left_down = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-corner-left.png",
                    priority = "extra-high",
                    width = 42,
                    height = 138,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(-6, 5.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-corner-left-shadow.png",
                    priority = "extra-high",
                    width = 126,
                    height = 111,
                    repeat_count = 5,
                    shift = util.by_pixel(17.68, 40.75),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            },
            t_up = {
                layers = {{
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-t-up.png",
                    priority = "extra-high",
                    width = 61,
                    height = 138,
                    variation_count = 5,
                    line_length = 5,
                    shift = util.by_pixel(0, 5.50),
                    scale = 0.5
                }, {
                    filename = "__ffences__/graphics/entity/steel-fence/steel-fence-t-up-shadow.png",
                    priority = "extra-high",
                    width = 131,
                    height = 110,
                    repeat_count = 5,
                    shift = util.by_pixel(19.94, 40.50),
                    draw_as_shadow = true,
                    scale = 0.5
                }}
            }
        },
        visual_merge_group = steel_fence_merge_group
    }
});


--[[
    Animation prototype definitions.
--]]
data:extend({
    {
        -- AnimationPrototype
        name = "iron-fence-single",
        type = "animation",
        layers = {
            {
                filename = "__ffences__/graphics/entity/iron-fence/iron-fence-single.png",
                priority = "extra-high",
                width = 15,
                height = 92,
                frame_count = 1,
                shift = util.by_pixel(0, -5),
                scale = 0.5
            },
            {
                filename = "__ffences__/graphics/entity/iron-fence/iron-fence-single-shadow.png",
                priority = "extra-high",
                width = 103,
                height = 73,
                frame_count = 1,
                shift = util.by_pixel(22.60, 31.25),
                draw_as_shadow = true,
                scale = 0.5
            }
        }
    },
    {
        -- AnimationPrototype
        name = "steel-fence-single",
        type = "animation",
        layers = {
            {
                filename = "__ffences__/graphics/entity/steel-fence/steel-fence-single.png",
                priority = "extra-high",
                width = 15,
                height = 92,
                frame_count = 1,
                shift = util.by_pixel(0, -5),
                scale = 0.5
            },
            {
                filename = "__ffences__/graphics/entity/steel-fence/steel-fence-single-shadow.png",
                priority = "extra-high",
                width = 103,
                height = 73,
                frame_count = 1,
                shift = util.by_pixel(22.60, 31.25),
                draw_as_shadow = true,
                scale = 0.5
            }
        }
    }
})