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
        name = "iron-fence",
        localised_description = {"item-description.iron-fence"},
        order = "a[wooden-fence]-a[iron-fence]",
        subgroup = "ffences",

        -- ItemPrototype
        stack_size = 100,
        drop_sound = item_sounds.wood_inventory_move,
        icon = "__ffences__/graphics/icons/iron-fence.png",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        place_result = "iron-fence"
    },
})