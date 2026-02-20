extends Plant

@onready var peaScene: PackedScene = preload("res://plants/peashooter/pea.tscn")
@onready var ap: AnimationPlayer = $AnimationPlayer
@onready var targeting: Targeting = $Targeting
@onready var shoot_marker: Marker2D = $Visuals/Sprite2D/ShootMarker
@onready var shoot_cooldown: Timer = $ShootCooldown
@onready var attack_animation: AnimationPlayer = $AttackAnimation

var canShoot: bool = true

func _process(delta: float) -> void:
	if targeting.getTarget() != null and canShoot:
		canShoot = false
		shoot_cooldown.start(1.5*GameStats.fireRateMult)
		shoot()

func shoot():
	attack_animation.stop()
	attack_animation.play("smush")
	var proj = peaScene.instantiate()
	proj.global_position = shoot_marker.global_position - Vector2(0,yOffset)
	proj.damage = 1 * GameStats.damageMult
	GlobalGame.projectiles.add_child(proj)

func _on_shoot_cooldown_timeout() -> void:
	canShoot = true
