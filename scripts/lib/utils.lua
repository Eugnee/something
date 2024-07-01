local Utils = {}

---comment
---@param value integer
---@param step integer
---@param threshold integer
---@return integer
function Utils.decrement(value, step, threshold)
    if value <= threshold then
        return threshold
    end
    value = value - step
    if value < threshold then
        return threshold
    end
    return value
end

---@param v number
---@param min number
---@param max number
---@return number
function Utils.clamp(v, min, max)
    return math.max(min, math.min(max, v))
end

---@param pos vector3
---@param other_pos vector3
---@return number
function Utils.angle_to(pos, other_pos)
    return -math.atan2(other_pos.x - pos.x, other_pos.y - pos.y)
end

---@param pos vector3
---@param other_pos vector3
---@return number
function Utils.distance_to(pos, other_pos)
    return vmath.length(pos - other_pos)
end

local random = math.random
function Utils.random_pos(n, from)
    if not from then
        from = vmath.vector3()
    end
    return vmath.vector3(from.x + random(-n, n), from.y + random(-n, n), 0)
end

local DISPLAY_WIDTH = sys.get_config_int("display.width")
local DISPLAY_HEIGHT = sys.get_config_int("display.height")

-- function to convert screen (mouse/touch) coordinates to
-- world coordinates given a camera component
-- this function will use the camera view and projection to
-- translate the screen coordinates into world coordinates
function Utils.screen_to_world(position, camera)
    local projection = go.get(camera, "projection")
    local view = go.get(camera, "view")
    local w, h = window.get_size()
    -- The window.get_size() function will return the scaled window size,
    -- ie taking into account display scaling (Retina screens on macOS for
    -- instance). We need to adjust for display scaling in our calculation.
    w = w / (w / DISPLAY_WIDTH)
    h = h / (h / DISPLAY_HEIGHT)

    -- https://defold.com/manuals/camera/#converting-mouse-to-world-coordinates
    local inv = vmath.inv(projection * view)
    local x = (2 * position.x / w) - 1
    local y = (2 * position.y / h) - 1
    local z = (2 * position.z) - 1
    local x1 = x * inv.m00 + y * inv.m01 + z * inv.m02 + inv.m03
    local y1 = x * inv.m10 + y * inv.m11 + z * inv.m12 + inv.m13
    local z1 = x * inv.m20 + y * inv.m21 + z * inv.m22 + inv.m23
    return vmath.vector3(x1, y1, z1)
end


return Utils

