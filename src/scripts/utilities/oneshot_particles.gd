class_name OneShotParticles
extends CPUParticles2D
## Simple class for instantiated one-shot particle effects that both auto-starts
## and free itself upon completion

func _ready() -> void:
	set_one_shot(true)
	connect(&'finished', func(): queue_free())
	set_emitting(true)
