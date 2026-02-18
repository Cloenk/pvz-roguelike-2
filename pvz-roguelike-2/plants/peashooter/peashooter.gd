extends Plant
@onready var ap: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	ap.play("Idle")
