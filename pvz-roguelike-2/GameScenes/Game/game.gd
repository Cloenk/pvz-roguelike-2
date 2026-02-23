extends Node2D
@onready var plants: Node2D = $Ysort/Plants
@onready var zombies: Node2D = $Ysort/Zombies
@onready var projectiles: Node2D = $Ysort/Projectiles
@onready var sun_counter_label: Label = $sunCounter/SunCounterLabel
@onready var lawn: Lawn = $Lawn

var displayedSun = 0.0

func _ready() -> void:
	GlobalGame.plants = plants
	GlobalGame.zombies = zombies
	GlobalGame.projectiles = projectiles
	GlobalGame.lawn = lawn

func _process(delta: float) -> void:
	displayedSun = lerp(displayedSun,GlobalGame.sun,6*delta)
	sun_counter_label.text = str("%.0f" % displayedSun)
