extends CharacterBody2D
@onready var targeting: Targeting = $Targeting

var damage = 1

func _process(delta: float) -> void:
	var target:Damage = targeting.getTarget()
	if target != null:
		target.damage(damage)
		queue_free()

func _physics_process(delta: float) -> void:
	velocity = Vector2(600,0)
	move_and_slide()
