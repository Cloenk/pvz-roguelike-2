extends Node2D
class_name SeedSlot

@export var plantResource: PlantResource

@onready var nameLabel: Label = $NameLabel

var available = true

func _process(delta: float) -> void:
	nameLabel.text = plantResource.name

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
	GlobalGame.selectedSeedSlot = null
