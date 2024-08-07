class_name Player
extends Actor
## Represents the player-controlled character in the game.

@export var propulsion_strength: float = 500.0

@export var bullet_cooldown: float = 0.2

@export var max_health: int = 3

@export var jump_particles: PackedScene

var health: int

var _can_shoot: bool = true

@onready var _propulsion_cooldown_timer: Timer = (
	$PropulsionCooldown as Timer)

func shoot() -> void:
	if jump_particles:
		add_child(jump_particles.instantiate() as CPUParticles2D)
	velocity.y = -propulsion_strength
	_can_shoot = false
	_propulsion_cooldown_timer.start()

func take_damage(damage: int) -> void:
	health -= damage

func _ready() -> void:
	_propulsion_cooldown_timer.set_wait_time(bullet_cooldown)
	_propulsion_cooldown_timer.connect(&'timeout', func(): _can_shoot = true)
	health = max_health

func _process(_delta: float) -> void:
	if Input.is_action_pressed('hover') and _can_shoot:
		shoot()
