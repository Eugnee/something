local C = {}

-- COMPONENTS
-- C.UNIT_SYSTEM = msg.url("main", "/main", "unit_system")

-- Z index
C.OBECTS_Z_INDEX = 0.1
C.MIN_STEP = 0.000001

-- TILES
C.TILE_SIZE = 16

-- ANIMATION
C.SPRITE = "#sprite"
C.SPRITE_DAMAGED = "#damaged"
C.SPRITE_FIRE_SIDE_RIGHT = "#fire_side_right"
C.SPRITE_FIRE_SIDE_LEFT = "#fire_side_left"
C.SPRITE_FIRE_FRONT = "#fire_front"
C.DEAD_ANIMATION_DELAY = 0.25

-- COLLISION GROUPS
C.HERO = hash("hero")
C.BLOCKED = hash("blocked")
C.ENEMY = hash("enemy")
C.ENEMY_NEARBY = hash("enemy_nearby")

C.BULLET_OFFSET = vmath.vector3(0, 5, 0)
C.UP_DIRECTION = vmath.vector3(0, 1, 0)

-- ACTIONS
C.FIRE = hash("fire")
C.LEFT = hash("left")
C.UP = hash("up")
C.RIGHT = hash("right")
C.DOWN = hash("down")
C.TALK = hash("talk")

-- ITEMS
C.BULLET_OFFSET = vmath.vector3(0, 5, 0)
C.BULLET_ROTATION = vmath.vector3(0, 1, 0)

-- GOBJECTS
C.PLAYER = hash("player")
C.ENEMY = hash("enemy")

-- MAP
C.MAP_WIDTH = 500
C.MAP_HEIGHT = 500
C.MAP_OFFSET = 10

-- FACTORIES
C.BULLET_FACTORY = "/base/factories#bullet"

return C
