extends Node2D
class_name Zombie

@export var speedRange: Vector2
@export var damage: Damage
@export var attackDamage: float = 1
@export var attackSpeed: float = 1
@export var eatingTarget: Targeting

var attackTimer: Timer
var speed: float
var canMove: bool = true
var isEating: bool = false
var canEat = true

func _ready() -> void:
	speed = randi_range(speedRange.x,speedRange.y)
	attackTimer = Timer.new()
	add_child(attackTimer)
	attackTimer.one_shot = true
	attackTimer.timeout.connect(attackTimerTimeout)

func _process(delta: float) -> void:
	var target = eatingTarget.getTarget()
	if target != null:
		isEating = true
		if canEat:
			canEat = false
			target.damage(attackDamage)
			attackTimer.start(attackSpeed)
	else:
		isEating = false
	
	if damage:
		if global_position.x < 1785:
			damage.canBeTargeted = true
		else:
			damage.canBeTargeted = false
	if !isEating and canMove:
		position.x -= speed*delta

func attackTimerTimeout():
	canEat = true
