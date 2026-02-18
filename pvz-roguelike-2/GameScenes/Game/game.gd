extends Node2D
@onready var plants: Node2D = $Ysort/Plants

func _ready() -> void:
	GlobalGame.plants = plants
