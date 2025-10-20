local first_tick = true

--[[
    Initializers.
--]]
local function initialize_storage()
    storage.ffences_ifro = storage.ffences_ifro or {} -- Iron Fence Render Object IDs
    storage.ffences_ifruq = storage.ffences_ifruq or {} -- Iron Fence Render Update Queue
end

--[[
    Iron fence graphic handlers.
--]]
local function iron_fence_update_data_from_entity(entity, level, previous)
    local data = {}
    data.entity = entity
    data.unit_number = entity.unit_number
    data.neighbours = entity.neighbours
    data.position = entity.position
    data.surface = entity.surface
    data.level = level
    data.previous = previous
    return data
end

-- Expected data:
-- {
--     entity = <entity>,
--     unit_number = <unit_number>,
--     neighbours = <neighbours>,
--     position = <position>,
--     surface = <index>,
--     level = <level>
-- }
local function update_iron_fence_graphics(data)
    local animation = "iron-fence-single"
    local variant_count = 5
    local variant = (data.unit_number + math.floor(data.position.x * 31 + data.position.y * 17)) % variant_count

    -- Check if we have a stored render object
    local roid = storage.ffences_ifro[data.unit_number]
    local ro = nil
    if roid then
        ro = rendering.get_object_by_id(roid)
    end

    -- Validate neighbors
    local neighbors = data.neighbours
    local function is_ours(entity)
        return entity and entity.valid and entity.name == "iron-fence"
    end
    local north = is_ours(neighbors.north)
    local east = is_ours(neighbors.east)
    local south = is_ours(neighbors.south)
    local west = is_ours(neighbors.west)

    -- Determine if we should render a post or not
    local should_render = false
    local render_layer = nil
    local render_offset_y = 0
    local render_offset_x = 0
    if data.entity.valid then
        -- Check if we are a solo, topmost fence in the column
        if
            not north and
            not east and
            south and
            not west then
            should_render = true
            render_layer = "lower-object-overlay"
            render_offset_y = -0.33
        -- Check if we are a bottomost horizontal fence with a fence above us
        elseif
            north and
            east and
            not south and
            west then
            should_render = true
            render_layer = "object" -- Unfortunately this is our only option here
        else
            -- If I intentionally avoid is_ours checks here,
            -- we avoid the overlapping issues with the limitations of "object"
            if not data.neighbours.south and not data.neighbours.north then
                local left = data.neighbours.west
                if
                    left and left.valid and
                    not left.neighbours.south and
                    not left.neighbours.north and
                    left.neighbours.west and
                    not storage.ffences_ifro[left.unit_number]
                then
                    local right = data.neighbours.east
                    if
                        right and right.valid and
                        not right.neighbours.south and
                        not right.neighbours.north and
                        right.neighbours.east and
                        not storage.ffences_ifro[right.unit_number]
                    then
                        should_render = true
                        render_layer = "object"
                    end
                end
            end

            -- Perform the previous check but vertically instead
            if not data.neighbours.east and not data.neighbours.west then
                local above = data.neighbours.north
                if
                    above and above.valid and
                    not above.neighbours.east and
                    not above.neighbours.west and
                    above.neighbours.north and
                    not storage.ffences_ifro[above.unit_number]
                then
                    local below = data.neighbours.south
                    if
                        below and below.valid and
                        not below.neighbours.east and
                        not below.neighbours.west and
                        below.neighbours.south and
                        not storage.ffences_ifro[below.unit_number]
                    then
                        should_render = true
                        render_layer = "lower-object-overlay"
                    end
                end
            end
        end
    end

    -- If we don't have a valid render object, create one
    -- Otherwise, update the existing one
    if should_render then
        local ok = pcall(function()
            if not ro or not ro.valid then
                ro = rendering.draw_animation{
                    animation = animation,
                    target = {data.position.x + render_offset_x, data.position.y + render_offset_y},
                    surface = data.surface,
                    render_layer = render_layer,
                    animation_offset = variant,
                    animation_speed = 0,
                }
                storage.ffences_ifro[data.unit_number] = ro.id
            else
                ro.animation = "iron-fence-single"
                ro.animation_offset = 0
            end
        end)

        -- If we failed to update, clean up
        if not ok then
            if ro and ro.valid then
                ro.destroy()
            end
            storage.ffences_ifro[data.unit_number] = nil
        end
    elseif roid then
        -- Remove the render object from storage
        if ro and ro.valid then
            ro.destroy()
        end
        storage.ffences_ifro[data.unit_number] = nil
    end

    -- Update immediate neighbors if top_level is true
    if data.level <= 3 then
        if north and neighbors.north.unit_number ~= data.previous then
            update_iron_fence_graphics(iron_fence_update_data_from_entity(neighbors.north, data.level + 1, data.unit_number))
        end
        if east and neighbors.east.unit_number ~= data.previous then
            update_iron_fence_graphics(iron_fence_update_data_from_entity(neighbors.east, data.level + 1, data.unit_number))
        end
        if south and neighbors.south.unit_number ~= data.previous then
            update_iron_fence_graphics(iron_fence_update_data_from_entity(neighbors.south, data.level + 1, data.unit_number))
        end
        if west and neighbors.west.unit_number ~= data.previous then
            update_iron_fence_graphics(iron_fence_update_data_from_entity(neighbors.west, data.level + 1, data.unit_number))
        end
    end
end

local function on_iron_fence_built(entity)
    -- Update graphics
    storage.ffences_ifruq[entity.unit_number] = iron_fence_update_data_from_entity(entity, 1, nil)
end

local function on_iron_fence_removed(entity)
    -- Update graphics
    storage.ffences_ifruq[entity.unit_number] = iron_fence_update_data_from_entity(entity, 1, nil)
end

--[[
    Initialization event hooks.
--]]
script.on_init(function()
    initialize_storage()
end)

script.on_configuration_changed(function(data)
    initialize_storage()
end)

--[[
    Entity lifecycle event hooks.
--]]
script.on_event({ defines.events.on_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive }, function(event)
    local entity = event.entity
    if not entity.valid then return end

    -- Pass entity build events to their respective handlers
    if entity.name == "iron-fence" then
        on_iron_fence_built(entity)
    end
end)

script.on_event({ defines.events.on_player_mined_entity, defines.events.on_entity_died, defines.events.script_raised_destroy }, function(event)
    local entity = event.entity
    if not entity.valid then return end

    -- Pass entity removal events to their respective handlers
    if entity.name == "iron-fence" then
        on_iron_fence_removed(entity)
    end
end)

script.on_event(defines.events.on_tick, function(event)
    -- First-tick initialization
    if first_tick then
        first_tick = false
        initialize_storage()
    end

    -- Process queued fence updates
    local remove_list = {}
    for unit_number, data in pairs(storage.ffences_ifruq) do
        local ok, error = pcall(function()
            update_iron_fence_graphics(data)
        end)
        if not ok then
            game.print("Error updating iron fence graphics for unit number " .. unit_number .. ": " .. error)
        end
        table.insert(remove_list, unit_number)
    end

    -- Remove after iteration (safe)
    for _, unit_number in ipairs(remove_list) do
        storage.ffences_ifruq[unit_number] = nil
    end
end)