class_name Actor
extends CharacterBody2D
## Simple CharacterBody2D extension that accounts for basic gravity, movement,
## and input.
## All velocity changes should be made through the child's `_process()`
## function. DO NOT OVERRIDE `_physics_process()`

@onready var _gravity: int = (
	ProjectSettings.get_setting('physics/2d/default_gravity') as int)

func _physics_process(delta: float) -> void:
	if motion_mode == MOTION_MODE_GROUNDED and not is_on_floor():
		velocity.y += _gravity * delta
	move_and_slide()
	print(velocity)
