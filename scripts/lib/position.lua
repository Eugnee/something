local position = {}


local MAP_WIDTH = 1000
local MAP_HEIGHT = 1000
local OFFSET = 10

-- set isometric position
---@param new_pos vector3
---@param z_index number
---@param id string|hash|url|nil
function position.set_iso_position(new_pos, z_index, id)
    new_pos.z = z_index - (new_pos.y * C.MIN_STEP)
    -- if new_pos.x > MAP_WIDTH - OFFSET then
    --     new_pos.x = MAP_WIDTH - OFFSET
    -- elseif new_pos.x < OFFSET then
    --     new_pos.x = OFFSET
    -- end
    -- if new_pos.y > MAP_HEIGHT - OFFSET then
    --     new_pos.y = MAP_HEIGHT - OFFSET
    -- elseif new_pos.y < OFFSET then
    --     new_pos.y = OFFSET
    -- end
    go.set_position(new_pos, id)
end

---@param obj {correction: vector3}
---@param message {distance: number, normal: vector3}
function position.correct_position(obj, message)
    if message.distance > 0 then
        local proj = vmath.project(obj.correction,
            message.normal * message.distance);
        if (proj < 1) then
            local comp = (message.distance - message.distance * proj) *
                message.normal;
            local new_pos = go.get_position() + comp
            position.set_iso_position(new_pos, C.OBECTS_Z_INDEX)
            obj.correction = obj.correction + comp;
        end
    end
end

return position
