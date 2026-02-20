extends Node2D
class_name Zombie

@export var speedRange: Vector2

var speed: float
var canMove: bool = true
var isEating: bool = false

func _ready() -> void:
	speed = randi_range(speedRange.x,speedRange.y)

func _process(delta: float) -> void:
	if !isEating and canMove:
		position.x -= speed*delta
