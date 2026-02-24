extends LawnObject
@onready var damage: Damage = $Damage
@onready var sprite_2d: Sprite2D = $Sprite2D

const GRAVE_STONE_FULL = preload("uid://biiq3kvul2ky5")
const GRAVE_STONE_33 = preload("uid://dhnayekwuj4mw")
const GRAVE_STONE_66 = preload("uid://bipfkxhhj7mh5")

func _process(delta: float) -> void:
	if damage.hp >= 0:
		sprite_2d.texture = GRAVE_STONE_33
	if damage.hp >= 16:
		sprite_2d.texture = GRAVE_STONE_66
	if damage.hp >= 33:
		sprite_2d.texture = GRAVE_STONE_FULL
