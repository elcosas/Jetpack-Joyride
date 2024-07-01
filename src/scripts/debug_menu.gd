class_name DebugMenu
extends CanvasLayer
## Simple debug menu

@export var player: Player

var _label: Label

func _ready() -> void:
	_label = Label.new()
	add_child(_label)

func _process(_delta: float) -> void:
	_label.set_text(
		'''
		FPS: %s\n
		Velocity: %s\n
		Can Shoot: %s\n
		''' % [
			str(Engine.get_frames_per_second()),
			str(player.velocity),
			str(player._can_shoot),]
	)
