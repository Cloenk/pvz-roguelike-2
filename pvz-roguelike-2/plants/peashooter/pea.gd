extends CharacterBody2D
@onready var targeting: Targeting = $Targeting
@onready var ray_cast_2d: RayCast2D = $Targeting/RayCast2D

var damage = 1

func _process(delta: float) -> void:
	var target:Damage = targeting.getTarget()
	if target != null:
		target.damage(damage)
		GlobalGame.spawnHitParticles(ray_cast_2d.get_collision_point(),Color.GREEN)
		queue_free()

func _physics_process(delta: float) -> void:
	velocity = Vector2(600,0)
	move_and_slide()
