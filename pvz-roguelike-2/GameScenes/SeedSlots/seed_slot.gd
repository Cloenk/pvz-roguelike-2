extends Node2D
class_name SeedSlot

const BORDER = preload("uid://dmwxgcjf8j72h")
const BORDER_SELECTED = preload("uid://dkg2sqoislxmr")

@export var plantResource: PlantResource
@export var keyBind: InputEventAction

@onready var sun_label: Label = $DarkenContainer/SunLabel
@onready var borderSprite: Sprite2D = $DarkenContainer/Border
@onready var bgSprite: Sprite2D = $DarkenContainer/BG
@onready var cooldown: Timer = $Cooldown
@onready var cooldown_label: Label = $CooldownLabel
@onready var darken_container: Node2D = $DarkenContainer

var available = true

func _process(delta: float) -> void:
	sun_label.text = str(plantResource.sunCost)
	if GlobalGame.selectedSeedSlot == self:
		borderSprite.texture = BORDER_SELECTED
	else:
		borderSprite.texture = BORDER
	if plantResource.texture:
		bgSprite.texture = plantResource.texture
	if !available or GlobalGame.sun < plantResource.sunCost:
		darken_container.modulate = Color.DIM_GRAY
		if !cooldown.is_stopped():
			cooldown_label.modulate = Color.WHITE
			cooldown_label.text = str("%.2f" % (cooldown.time_left))
	else:
		darken_container.modulate = Color.WHITE
		cooldown_label.modulate = Color.TRANSPARENT
	if Input.is_action_just_pressed(keyBind.action):
		_on_button_pressed()

func _on_button_pressed() -> void:
	if GlobalGame.sun >= plantResource.sunCost and available and !GlobalGame.isShoveling:
		if GlobalGame.selectedSeedSlot == null:
			GlobalGame.selectedSeedSlot = self
		else:
			if GlobalGame.selectedSeedSlot != self:
				GlobalGame.selectedSeedSlot = self
			else:
				GlobalGame.selectedSeedSlot = null

func use():
	available = false
	cooldown.start(plantResource.rechargeTime)
	GlobalGame.sun -= plantResource.sunCost
	GlobalGame.selectedSeedSlot = null

func _on_cooldown_timeout() -> void:
	cooldown_label.modulate = Color.TRANSPARENT
	available = true
