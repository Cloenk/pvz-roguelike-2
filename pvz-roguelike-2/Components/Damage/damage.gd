extends Area2D
class_name Damage

enum teams {Plants,Zombies,Obstacles,Neutral}

@export var host: Node2D
@export var team: teams
@export var maxHp: float
@export var maxArmor: float
@export var defense: float
var hp: float
var armor: float

signal death(leftOver: float)

func _ready() -> void:
	hp = maxHp
	armor = maxArmor
	add_to_group(getTeamString())

func damage(amount: float):
	amount -= defense
	if amount < 0:
		amount = 0
		return
	if armor > 0:
		armor -= amount
		return
	hp -= amount
	if hp <= 0:
		die(0 - hp)

func die(leftOver: float):
	death.emit(leftOver)
	host.queue_free()

func getTeamString():
	return teams.keys()[team]
