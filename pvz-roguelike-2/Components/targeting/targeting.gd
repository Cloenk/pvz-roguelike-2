extends Node2D
class_name Targeting

@export var host: Node2D
@export var targetRayCast: RayCast2D
@export var targetGroups: Array[String] = ["Plants","Zombies","Obstacles","Neutral"]

func getTarget():
	targetRayCast.collide_with_areas = true
	if targetRayCast.is_colliding():
		var collider: Damage = targetRayCast.get_collider()
		if targetGroups.has(collider.getTeamString()):
			return collider
