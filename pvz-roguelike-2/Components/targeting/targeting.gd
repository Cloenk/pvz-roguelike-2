extends Node2D
class_name Targeting

@export var targetRayCast: RayCast2D
@export var targetGroups: Array[String] = ["Plants","Zombies","Obstacles","Neutral"]

func getTarget():
	setCollisionLayer(targetGroups)
	targetRayCast.collide_with_areas = true
	if targetRayCast.is_colliding():
		var collider: Damage = targetRayCast.get_collider()
		if targetGroups.has(collider.getTeamString()) and collider.canBeTargeted:
			return collider

func setCollisionLayer(teams: Array[String]):
	targetRayCast.set_collision_mask_value(1,false)
	targetRayCast.set_collision_mask_value(2,false)
	targetRayCast.set_collision_mask_value(3,false)
	targetRayCast.set_collision_mask_value(4,false)
	if teams.has("Plants"):
		targetRayCast.set_collision_mask_value(1,true)
	if teams.has("Zombies"):
		targetRayCast.set_collision_mask_value(2,true)
	if teams.has("Obstacles"):
		targetRayCast.set_collision_mask_value(3,true)
	if teams.has("Neutral"):
		targetRayCast.set_collision_mask_value(4,true)
