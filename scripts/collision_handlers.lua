local CH = {}
local OM = require "scripts.logic.gobject"
-- TODO: move to separet file
local function handle_collision_between_enemy_and_hero (hero_collision, enemy_collision)
    local enemy_data = OM.get_gobject(enemy_collision.id)
    local enemy_pos = go.get_position(enemy_data.url)
    go.set_position(enemy_pos + enemy_collision.normal * 10, enemy_data.url)
    enemy_data.hero_touchs_count = enemy_data.hero_touchs_count + 1
    if enemy_data.hero_touchs_count % 10 == 0 then
        local hero_data = OM.get_gobject(hero_collision.id)
        print("Why do you beat me?")
        enemy_data.hp = enemy_data.hp - hero_data.damage
    end
end

function CH.point_response(a, b)
    if a.group == hash("hero") and b.group == hash("enemy")  then
        handle_collision_between_enemy_and_hero(a, b)
    elseif b.group == hash("hero") and a.group == hash("enemy") then
        handle_collision_between_enemy_and_hero(a, b)
    end
end



return CH