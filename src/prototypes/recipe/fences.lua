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
    },
    {
        -- Prototype
        name = "wooden-gate",
        type = "recipe",

        -- RecipePrototype
        allow_quality = false,
        enabled = true,
        energy_required = 0.5,
        ingredients = {
            {
                type = "item",
                name = "wooden-fence",
                amount = 1
            },
            {
                type = "item",
                name = "iron-plate",
                amount = 2
            }
        },
        results = {
            {
                type = "item",
                name = "wooden-gate",
                amount = 1
            }
        }
    },
    {
        -- Prototype
        name = "iron-fence",
        type = "recipe",

        -- RecipePrototype
        allow_quality = false,
        enabled = true,
        energy_required = 0.5,
        ingredients = {
            {
                type = "item",
                name = "iron-plate",
                amount = 5
            }
        },
        results = {
            {
                type = "item",
                name = "iron-fence",
                amount = 1
            }
        }
    },
    {
        -- Prototype
        name = "steel-fence",
        type = "recipe",

        -- RecipePrototype
        allow_quality = false,
        enabled = true,
        energy_required = 0.5,
        ingredients = {
            {
                type = "item",
                name = "steel-plate",
                amount = 5
            }
        },
        results = {
            {
                type = "item",
                name = "steel-fence",
                amount = 1
            }
        }
    }
});