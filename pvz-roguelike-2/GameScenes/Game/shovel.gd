extends Node2D

@onready var shovel: Sprite2D = $Shovel

func _process(delta: float) -> void:
	var distance = global_position.distance_to(get_global_mouse_position())
	if GlobalGame.isShoveling:
		shovel.global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("LMB") and distance <= 70 or Input.is_action_just_pressed("shovel"):
			GlobalGame.isShoveling = false
	else:
		shovel.global_position = global_position
		if Input.is_action_just_pressed("LMB") and distance <= 70 or Input.is_action_just_pressed("shovel"):
			GlobalGame.isShoveling = true
			GlobalGame.selectedSeedSlot = null
