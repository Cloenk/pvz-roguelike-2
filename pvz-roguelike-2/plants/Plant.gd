extends Node2D
class_name Plant

@export var plantResource: PlantResource
@export var Maxhp: float = 5
@export var idleAnimation: AnimationPlayer
var hp
var lawnPos: Vector2i

func _ready() -> void:
	hp = Maxhp
	if idleAnimation:
		idleAnimation.play("Idle")
