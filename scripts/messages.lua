local M = {}
-- UI
M.START_TIMER = hash("start_timer")
M.INCR_MONSTETS_COUNT = hash("incr_monsters_count")
M.UPDATE_GUI_SCORE = hash("update_gui_score")
M.CHANGE_HP_BAR = hash("change_hp_bar")
M.UNLOCK_DIALOGUE = hash("unlock_dialogue")
M.LOCK_DIALOGUE = hash("lock_dialogue")
M.SCORE = hash("score")

-- UNIT
M.MAKE_DAMAGE = hash("make_damage")
M.ENEMY_DAMAGE = hash("enemy_damage")
M.IS_DEAD = hash("is_dead")

-- ITEMS
M.ITEM_PICK_UP = hash("item_pick_up")

-- COLLISION
M.UNIT = hash("unit")
M.TRIGGER_RESPONSE = hash("trigger_response")
M.CONTACT_POINT_RESPONSE = hash("contact_point_response")

-- COMPONENTS
M.DISABLE = hash("disable")
M.ENABLE = hash("enable")

-- COLLECTIONS
M.PROXY_LOADED = hash("proxy_loaded")
M.PROXY_UNLOADED = hash("proxy_unloaded")
M.LOAD = hash("load")
M.UNLOAD = hash("unload")

M.GAME_OVER = hash("game_over")
M.RESTART = hash("restart")
M.START_GAME = hash("start_game")
M.GAME_CONTROLLER = msg.url("game:/levels#game_controller")
M.SOUND_GATE = "/base/sounds#sound_gate"
M.PLAY_SOUND = hash("play_gated_sound")

-- INPUT
M.ACQUIRE_INPUT_FOCUS = hash("acquire_input_focus")
M.RELEASE_INPUT_FOCUS = hash("release_input_focus")

M.INCREASE_HP = hash("increase_hp")

return M
