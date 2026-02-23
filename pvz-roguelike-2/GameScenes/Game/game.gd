extends Node2D

@onready var sunScene: PackedScene = preload("res://GameScenes/Sun/sun.tscn")

@onready var plants: Node2D = $Ysort/Plants
@onready var zombies: Node2D = $Ysort/Zombies
@onready var projectiles: Node2D = $Ysort/Projectiles
@onready var sun_counter_label: Label = $sunCounter/SunCounterLabel
@onready var lawn: Lawn = $Lawn
@onready var sun_timer: Timer = $SunTimer
@onready var sun_container: Node2D = $SunContainer

var displayedSun = 0.0

func _ready() -> void:
	GlobalGame.plants = plants
	GlobalGame.zombies = zombies
	GlobalGame.projectiles = projectiles
	GlobalGame.lawn = lawn
	startLevel()	

func startLevel():
	sun_timer.start(randf_range(9,11))

func spawnSun():
	var sun = sunScene.instantiate()
	sun.global_position = Vector2(randi_range(450,1750),-75)
	sun_container.add_child(sun)
	sun.fallFromSky()
	sun_timer.start(randf_range(9,11))

func _process(delta: float) -> void:
	displayedSun = lerp(displayedSun,GlobalGame.sun,6*delta)
	sun_counter_label.text = str("%.0f" % displayedSun)
