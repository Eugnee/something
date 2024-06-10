local OM = {}

-- map of Game Objects
local GOBJECTS = {}

function OM.create_gobject(data)
    GOBJECTS[go.get_id()] = data
end

function OM.delete_gobject()
    GOBJECTS[go.get_id()] = nil
end

---comment
---@param id any
function OM.get_unit(id)
    return GOBJECTS[id]
end

return OM
