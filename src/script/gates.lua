--[[
    Wooden gate event hooks.
--]]
local function on_wooden_gate_built(entity)
    local surface = entity.surface
    local position = entity.position
    local direction = entity.direction

    -- Define directional offsets (horizontal and vertical)
    local offsets = {}
    if direction == defines.direction.east or direction == defines.direction.west then
        offsets = {
            { x = -1, y = 0 }, -- left
            { x =  1, y = 0 }  -- right
        }
    elseif direction == defines.direction.north or direction == defines.direction.south then
        offsets = {
            { x = 0, y = -1 }, -- above
            { x = 0, y =  1 }  -- below
        }
    else
        return -- not a supported direction
    end

    -- Helper to check for rails under a given position
    local function has_rail_at(pos)
        return #surface.find_entities_filtered{ position = pos, type = "straight-rail" } > 0
    end

    -- Try both directions for a matching gate
    for _, offset in ipairs(offsets) do
        local neighbor_pos = { x = position.x + offset.x, y = position.y + offset.y }

        -- Skip if rails under either gate
        if has_rail_at(position) or has_rail_at(neighbor_pos) then
            return
        end

        -- Check for matching neighbor gate
        local neighbor_gate = surface.find_entity("wooden-gate", neighbor_pos)
        if neighbor_gate and neighbor_gate.valid then
            -- Collect properties before replacement
            local quality = entity.quality
            local force = entity.force
            local player = entity.last_user

            -- Destroy current gate and replace with double
            entity.destroy()

            surface.create_entity{
                name = "wooden-gate-double",
                position = position,
                direction = direction,
                quality = quality,
                force = force,
                undo_index = 0,
                player = player,
                create_build_effect_smoke = false,
                move_stuck_players = true
            }

            return -- done once successful
        end
    end
end


--[[
    Entity lifecycle event hooks.
--]]
script.on_event({ defines.events.on_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive }, function(event)
    local entity = event.entity
    if not entity.valid then return end

    -- Pass entity build events to their respective handlers
    if entity.name == "wooden-gate" then
        on_wooden_gate_built(entity)
    end
end)