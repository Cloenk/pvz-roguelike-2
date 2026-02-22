extends Node2D
@onready var plants: Node2D = $Ysort/Plants
@onready var zombies: Node2D = $Ysort/Zombies
@onready var projectiles: Node2D = $Ysort/Projectiles
@onready var sun_counter_label: Label = $GUI/sunCounter/SunCounterLabel

func _ready() -> void:
	GlobalGame.plants = plants
	GlobalGame.zombies = zombies
	GlobalGame.projectiles = projectiles

func _process(delta: float) -> void:
	sun_counter_label.text = str(GlobalGame.sun)
