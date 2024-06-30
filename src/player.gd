class_name Player
extends Actor
## Represents the player-controlled character in the game.

@export var propulsion_strength: float = 500.0

@export var bullet_cooldown: float = 0.2

var _can_shoot: bool = true

@onready var _propulsion_cooldown_timer: Timer = (
	$PropulsionCooldown as Timer)

func shoot() -> void:
	velocity.y = -propulsion_strength
	_can_shoot = false
	_propulsion_cooldown_timer.start()

func _ready() -> void:
	_propulsion_cooldown_timer.set_wait_time(bullet_cooldown)
	_propulsion_cooldown_timer.connect(&'timeout', func(): _can_shoot = true)

func _process(delta: float) -> void:
	if Input.is_action_pressed('hover') and _can_shoot:
		shoot()
