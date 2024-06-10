local OM = {}

-- map of Game Objects
local GOBJECTS = {}

---comment
---@param id hash
function OM.create_unit(id, unit)
    GOBJECTS[id] = unit
end

---comment
---@param id hash
function OM.delete_unit(id)
    GOBJECTS[id] = nil
end

---comment
---@param id any
function OM.get_unit(id)
    return GOBJECTS[id]
end

return OM
