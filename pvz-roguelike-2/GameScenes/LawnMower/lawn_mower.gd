extends CharacterBody2D
@onready var targeting: Targeting = $Targeting

func _process(delta: float) -> void:
	var target = targeting.getTarget()
	if target != null:
		velocity = Vector2(700,0)
		target.die(0)

func _physics_process(delta: float) -> void:
	move_and_slide()
