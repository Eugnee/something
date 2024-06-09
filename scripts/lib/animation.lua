local ANIM = {}

---@class AnimatedObj
---@field locked_anim bool
---@field current_anim userdata

---@param obj AnimatedObj
---@param url string|userdata
---@param animation userdata
---@param with_lock bool|nil
---@param complete_func fun(self, message_id, message, sender)|nil
----@param before_anim fun(self)|nil
function ANIM.play_animation(obj, url, animation, with_lock, complete_func)
    if obj.locked_anim or obj.current_anim == animation then
        return
    end
    if with_lock then
        obj.locked_anim = true
        -- lock animate until something release lock
    end
    obj.current_anim = animation
    -- if before_anim ~= nil then
    --     before_anim(obj)
    -- end
    sprite.play_flipbook(url, animation, function(self)
        if complete_func then
            complete_func(self)
        end
        self.locked_anim = false
    end)
end

local MOVEMENT_MAP = {
    "up",
    "right",
    "down",
    "left",
}

---@param dir vector3
---@return string
function ANIM.animate_4_movement(dir)
    local anim
    if math.abs(dir.x) > math.abs(dir.y) then
        if (dir.x > 0) then
            anim = 2;
        else
            anim = 4;
        end
    else
        if dir.y > 0 then
            anim = 1;
        else
            anim = 3;
        end
    end
    anim = MOVEMENT_MAP[anim]
    return anim
end


return ANIM
