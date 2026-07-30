extends CharacterBody2D
@onready var back: Sprite2D = $Back
@onready var backest: Sprite2D = $Backest
@onready var ap: AnimationPlayer = $AnimationPlayer
@onready var stop_timer: Timer = $StopTimer

var hasBeenCollected: bool = false
var isFromSky: bool = false
var isFromFlower: bool = false

func _process(delta: float) -> void:
	back.rotation += 1*delta
	backest.rotation -= 1*delta
	var distance = global_position.distance_to(get_global_mouse_position())
	if Input.is_action_pressed("LMB") and distance <= 60 and !hasBeenCollected:
		hasBeenCollected = true
	if hasBeenCollected:
		global_position = lerp(global_position,Vector2(110,125),6.67*delta)
		if global_position.distance_to(Vector2(110,125)) <= 10:
			collect()
	if isFromSky and !hasBeenCollected:
		global_position.y += 100 * delta
	if isFromFlower and !hasBeenCollected:
		velocity.y += 1000 * delta
	move_and_slide()

func spawnFromFlower():
	velocity = Vector2(randi_range(-100,100),randi_range(-500,-600))
	isFromFlower = true
	stop_timer.start(1.3)

func fallFromSky():
	isFromSky = true
	stop_timer.start(randf_range(3,10))

func giveSun():
	GlobalGame.sun += 50

func collect():
	ap.play("Delete")

func _on_stop_timer_timeout() -> void:
	isFromSky = false
	isFromFlower = false
	velocity = Vector2.ZERO
