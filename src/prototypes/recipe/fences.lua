data:extend({
    {
        -- Prototype
        name = "wooden-fence",
        type = "recipe",

        -- RecipePrototype
        allow_quality = false,
        enabled = true,
        energy_required = 0.5,
        ingredients = {
            {
                type = "item",
                name = "wood",
                amount = 2
            }
        },
        results = {
            {
                type = "item",
                name = "wooden-fence",
                amount = 1
            }
        }
    }
});