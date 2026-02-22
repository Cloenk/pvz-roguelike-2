extends Area2D
class_name Damage

enum teams {Plants,Zombies,Obstacles,Neutral}

@export var host: Node2D
@export var team: teams
@export var maxHp: float
@export var maxArmor: float
@export var defense: float
@export var canBeTargeted: bool = true
var hp: float
var armor: float

signal death(leftOver: float)

func _ready() -> void:
	hp = maxHp
	armor = maxArmor
	add_to_group(getTeamString())
	setCollisionLayer(getTeamString())

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
	if team == teams.Plants:
		GlobalGame.lawn.plantsOnLawn.erase(host)
	host.queue_free()

func setCollisionLayer(newTeam:String):
	match newTeam:
		"Plants":
			set_collision_layer(1)
			set_collision_mask(1)
		"Zombies":
			set_collision_layer(2)
			set_collision_mask(2)
		"Obstacles":
			set_collision_layer(3)
			set_collision_mask(3)
		"Neutral":
			set_collision_layer(4)
			set_collision_mask(4)

func getTeamString():
	return teams.keys()[team]
