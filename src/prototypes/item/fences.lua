local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
    {
        type = "item",
        name = "wooden-fence",
        icon = "__ffences__/graphics/icons/wooden-fence.png",
        subgroup = "ffences",
        order = "a[wooden-fence]-a[wooden-fence]",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        drop_sound = item_sounds.wood_inventory_move,
        place_result = "wooden-fence",
        stack_size = 50
    },
    {
        type = "item",
        name = "iron-fence",
        icon = "__base__/graphics/icons/wall.png",
        subgroup = "ffences",
        order = "a[stone-wall]-b[iron-fence]",
        inventory_move_sound = item_sounds.concrete_inventory_move,
        pick_sound = item_sounds.concrete_inventory_pickup,
        drop_sound = item_sounds.concrete_inventory_move,
        place_result = "iron-fence",
        stack_size = 100
    }
})