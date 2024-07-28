class_name Actor
extends CharacterBody2D
## Simple CharacterBody2D extension that accounts for basic gravity, movement,
## collision, rotation, and input.
## All velocity changes should be made through the child's `_process()`
## function. DO NOT OVERRIDE `_physics_process()`

@export var rotational_velocity: float = 0.0

@onready var _gravity: int = (
	ProjectSettings.get_setting('physics/2d/default_gravity') as int)

var last_collision: KinematicCollision2D

func _physics_process(delta: float) -> void:
	if motion_mode == MOTION_MODE_GROUNDED and not is_on_floor():
		velocity.y += _gravity * delta
	rotate(rotational_velocity * PI / 180.0)
	move_and_slide()
	last_collision = get_last_slide_collision()
