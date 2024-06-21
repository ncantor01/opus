extends character_behavior

@export var idle_movement_mod = 1
@export var max_idle_movement_ticks: int = 200
@export var unmoving_ticks = 40
var current_tick = 0
var current_idle_dir = Vector2.ZERO

func _enter_tree():
	set_meta(&"behavior", ["movement"])
	pass

func move():
	if current_tick <= 0:
		current_idle_dir = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized() * idle_movement_mod
		current_tick = max_idle_movement_ticks * randf_range(0,1)
		return current_idle_dir
	elif  current_tick > unmoving_ticks:
		current_tick -= 1
		return current_idle_dir
	current_tick -= 1
	return Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
