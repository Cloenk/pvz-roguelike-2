extends Plant

@onready var sunScene: PackedScene = preload("res://GameScenes/Sun/sun.tscn")
@onready var flower_jump: AnimationPlayer = $"flower jump"
@onready var shoot_marker: Marker2D = $Visuals/Sprite2D/ShootMarker

func startGivingSun():
	flower_jump.play("jump")

func spawnSun():
	var newSun = sunScene.instantiate()
	GlobalGame.game.sun_container.add_child(newSun)
	newSun.global_position = shoot_marker.global_position
	newSun.spawnFromFlower()
