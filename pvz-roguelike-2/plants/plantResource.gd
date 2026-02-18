extends Resource
class_name PlantResource

@export var name: String
@export var sunCost: int
@export var texture: Texture
@export var rechargeTime: float
@export var scene: PackedScene
@export var grassOnlyPlant: bool = false
@export var grassPlant: bool = true
@export var waterPlant: bool = false
@export var earthPlant: bool = false
@export var extraPlant: bool = false
@export var tileOverrider: bool = false
@export var newTileType: String
@export var YaddAmount: float = 0
