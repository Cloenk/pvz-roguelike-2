extends Node2D
@onready var plants: Node2D = $Ysort/Plants
@onready var zombies: Node2D = $Ysort/Zombies
@onready var projectiles: Node2D = $Ysort/Projectiles

func _ready() -> void:
	GlobalGame.plants = plants
	GlobalGame.zombies = zombies
	GlobalGame.projectiles = projectiles
