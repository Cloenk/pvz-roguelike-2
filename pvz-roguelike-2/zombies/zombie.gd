extends Node2D
class_name Zombie

@export var speedRange: Vector2
@export var damage: Damage

var speed: float
var canMove: bool = true
var isEating: bool = false

func _ready() -> void:
	speed = randi_range(speedRange.x,speedRange.y)

func _process(delta: float) -> void:
	if damage:
		if global_position.x < 1785:
			damage.canBeTargeted = true
		else:
			damage.canBeTargeted = false
	if !isEating and canMove:
		position.x -= speed*delta
