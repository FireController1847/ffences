local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        -- Prototype
        type = "item",
        name = "wooden-fence",
        localised_description = {"item-description.wooden-fence"},
        order = "a[stone-wall]-a[wooden-fence]",
        subgroup = "ffences",

        -- ItemPrototype
        stack_size = 100,
        drop_sound = item_sounds.wood_inventory_move,
        icon = "__ffences__/graphics/icons/wooden-fence.png",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        place_result = "wooden-fence"
    },
    {
        -- Prototype
        type = "item",
        name = "wooden-gate",
        localised_description = {"item-description.wooden-gate"},
        order = "a[stone-wall]-b[wooden-gate]",
        subgroup = "ffences",

        -- ItemPrototype
        stack_size = 100,
        drop_sound = item_sounds.wood_inventory_move,
        icon = "__ffences__/graphics/icons/wooden-gate.png",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        place_result = "wooden-gate"
    },
    {
        -- Prototype
        type = "item",
        name = "iron-fence",
        localised_description = {"item-description.iron-fence"},
        order = "a[stone-wall]-c[iron-fence]",
        subgroup = "ffences",

        -- ItemPrototype
        stack_size = 100,
        drop_sound = item_sounds.metal_small_inventory_move,
        icon = "__ffences__/graphics/icons/iron-fence.png",
        inventory_move_sound = item_sounds.metal_small_inventory_move,
        pick_sound = item_sounds.metal_small_inventory_pickup,
        place_result = "iron-fence"
    },
    {
        -- Prototype
        type = "item",
        name = "steel-fence",
        localised_description = {"item-description.steel-fence"},
        order = "a[stone-wall]-e[steel-fence]",
        subgroup = "ffences",

        -- ItemPrototype
        stack_size = 100,
        drop_sound = item_sounds.metal_large_inventory_move,
        icon = "__ffences__/graphics/icons/steel-fence.png",
        inventory_move_sound = item_sounds.metal_large_inventory_move,
        pick_sound = item_sounds.metal_large_inventory_pickup,
        place_result = "steel-fence"
    }
})