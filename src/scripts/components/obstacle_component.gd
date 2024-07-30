class_name ObstacleComponent
extends Area2D
## Modifies Actor to an Obstacle: a collision object that constantly moves 
## from the right side of the screen to the left, dealing damage to the player 
## on contact

@export var body: Actor

@export var damage: int = 1

@export var move_speed: float = 100.0

func collide(colbody: Node2D) -> void:
	if colbody is Player:
		(colbody as Player).take_damage(damage)
		# free the body so the whole obstacle is removed from the scene
		body.queue_free()

func _ready() -> void:
	# since this is an obstacle, it just needs to have a constant x velocity
	# to keep up with the rest of the level's objects
	body.velocity.x = -move_speed
	connect(&'body_entered', collide)
	
