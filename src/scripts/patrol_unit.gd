class_name PatrolUnit
extends Actor
## Represents a Patrol Unit: a ground-moving obstacle with the same properties
## as the player. Ultimately prevents the player from spending too long on the
## ground to avoid floating obstacles.

@export var damage: int = 1

@export var move_speed: float = 100.0

func _ready() -> void:
	# since this is an obstacle, it just needs to have a constant x velocity
	# to keep up with the rest of the level's objects
	velocity.x = -move_speed

func _process(delta: float) -> void:
	if last_collision and last_collision.get_collider() is Player:
		var player_ref: Player = last_collision.get_collider() as Player
		player_ref.take_damage(damage)
		queue_free()
