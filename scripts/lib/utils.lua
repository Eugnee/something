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

return Utils
