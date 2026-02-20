extends Node2D
class_name Plant

@export var plantResource: PlantResource
@export var idleAnimation: AnimationPlayer
@export var collisionBox: CollisionShape2D
var lawnPos: Vector2i
var yOffset: float

func _ready() -> void:
	if idleAnimation:
		idleAnimation.play("Idle")
	if collisionBox:
		collisionBox.position.y -= yOffset
