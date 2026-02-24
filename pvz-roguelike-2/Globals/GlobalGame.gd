extends Node

@onready var hitParticlesScene: PackedScene = preload("res://Components/HitParticles/hit_particles.tscn")

var sun: float = 1000
var selectedSeedSlot: SeedSlot
var isShoveling = false
var plants
var zombies
var projectiles
var lawn: Lawn

func spawnHitParticles(pos:Vector2,color:Color):
	var particles = hitParticlesScene.instantiate()
	particles.global_position = pos
	particles.modulate = color
	projectiles.add_child(particles)
