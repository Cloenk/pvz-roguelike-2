extends Plant
@onready var ap: AnimationPlayer = $AnimationPlayer
@onready var targeting: Targeting = $Targeting

func _ready() -> void:
	ap.play("Idle")

func _process(delta: float) -> void:
	print(targeting.getTarget())
