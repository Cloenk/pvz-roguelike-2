extends Node2D
@onready var plants: Node2D = $Ysort/Plants
@onready var zombies: Node2D = $Ysort/Zombies

func _ready() -> void:
	GlobalGame.plants = plants
	GlobalGame.zombies = zombies
