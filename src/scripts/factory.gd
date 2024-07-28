class_name Factory
extends Node
## generates obstacles that the player can interact with

@export var obstacle: PackedScene

var y_bounds: Array[int]

func spawn() -> void:
	var obstacle_inst: Node2D = obstacle.instantiate() as Node2D
	var y_coord: int = randi_range(y_bounds.min(), y_bounds.max())
	obstacle_inst.position.y = y_coord

func _ready() -> void:
	y_bounds
