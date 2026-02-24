extends Node2D
class_name Lawn
const GRAVE_STONE = preload("uid://cpksb545pf7aa")

@onready var tile_map: TileMap = $TileMap
@onready var lawn_objects: Node2D = $"../Ysort/LawnObjects"

var plantsOnLawn: Array[Plant] = []
var yAddAmount = 0

func _ready() -> void:
	spawnLawnObjct(GRAVE_STONE,Vector2i(4,0))

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("LMB"):
		if GlobalGame.isShoveling:
			GlobalGame.isShoveling = false
			var extraPlant: Plant = getExtraPlantFromTile(getTilePosFromMouse())
			if extraPlant:
				plantsOnLawn.erase(extraPlant)
				extraPlant.queue_free()
				return
			var normalPlant: Plant = getNormalPlantFromTile(getTilePosFromMouse())
			if normalPlant:
				plantsOnLawn.erase(normalPlant)
				normalPlant.queue_free()
				return
			var TileOverriderPlant: Plant = getTileOverriderPlantFromTile(getTilePosFromMouse())
			if TileOverriderPlant:
				plantsOnLawn.erase(TileOverriderPlant)
				TileOverriderPlant.queue_free()
				return
		if GlobalGame.selectedSeedSlot:
			yAddAmount = 0
			if canPlantBePlaced(getTilePosFromMouse(),GlobalGame.selectedSeedSlot.plantResource):
				var newPlant:Plant = GlobalGame.selectedSeedSlot.plantResource.scene.instantiate()
				newPlant.global_position = getTileGlobalPos(getTilePosFromMouse()) + Vector2(0,yAddAmount)
				newPlant.yOffset = yAddAmount
				plantsOnLawn.append(newPlant)
				newPlant.lawnPos = getTilePosFromMouse()
				newPlant.plantResource = GlobalGame.selectedSeedSlot.plantResource
				GlobalGame.plants.add_child(newPlant)
				if GlobalGame.selectedSeedSlot.plantResource.extraPlant:
					newPlant.add_to_group("extraPlant")
				elif GlobalGame.selectedSeedSlot.plantResource.tileOverrider:
					newPlant.add_to_group("TileOverriderPlant")
				else:
					newPlant.add_to_group("normalPlant")
				print("planted: ",GlobalGame.selectedSeedSlot.plantResource.name)
				GlobalGame.selectedSeedSlot.use()
	if Input.is_action_just_pressed("RMB"):
		GlobalGame.selectedSeedSlot = null

func spawnLawnObjct(object: PackedScene,tilePos:Vector2i):
	var newObject = object.instantiate()
	newObject.global_position = getTileGlobalPos(tilePos)
	lawn_objects.add_child(newObject)

func canPlantBePlaced(tilePos:Vector2i, plant:PlantResource):
	var tileType = getTileType(tilePos)
	var tileOverrider = getTileOverriderPlantFromTile(tilePos)
	if tileOverrider != null:
		tileType = tileOverrider.plantResource.newTileType
		yAddAmount = tileOverrider.plantResource.YaddAmount
	if tileType == "Earth" and plant.earthPlant:
		return isTileOccupied(tilePos,plant)
	if tileType == "Water" and plant.waterPlant:
		return isTileOccupied(tilePos,plant)
	if tileType == "Grass" and plant.grassPlant:
		return isTileOccupied(tilePos,plant)
	return false

func isTileOccupied(tilePos:Vector2i, plant:PlantResource):
	if plant.extraPlant:
		if getExtraPlantFromTile(tilePos) == null:
			return true
		else:
			return false
	if plant.tileOverrider:
		if getTileOverriderPlantFromTile(tilePos) == null:
			return true
		else:
			return false
	if plant.grassPlant:
		if getNormalPlantFromTile(tilePos) == null:
			return true
		else:
			return false
	return false

func getNormalPlantFromTile(tilePos:Vector2i):
	for plant in plantsOnLawn:
		if plant.is_in_group("normalPlant") and plant.lawnPos == tilePos:
			return plant
func getExtraPlantFromTile(tilePos:Vector2i):
	for plant in plantsOnLawn:
		if plant.is_in_group("extraPlant") and plant.lawnPos == tilePos:
			return plant
func getTileOverriderPlantFromTile(tilePos:Vector2i):
	for plant in plantsOnLawn:
		if plant.is_in_group("TileOverriderPlant") and plant.lawnPos == tilePos:
			return plant

func getTilePosFromMouse():
	return tile_map.local_to_map(tile_map.to_local(get_global_mouse_position()))
func getTileType(tilePos:Vector2i):
	return tile_map.get_cell_tile_data(0,tilePos).get_custom_data("TileType")
func getTileGlobalPos(tilePos:Vector2i):
	return tile_map.to_global(tile_map.map_to_local(tilePos))
