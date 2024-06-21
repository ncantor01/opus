extends character_behavior

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	set_meta(&"behavior", ["movement"])
	pass

func _exit_tree():
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("attack"):
		owner.get_weapon().hold_attack(get_global_mouse_position())
	pass

func move():
	var vertical_direction = Input.get_axis("up", "down")
	var horizontal_direction = Input.get_axis("left", "right")
	return (Vector2(horizontal_direction, vertical_direction).normalized())

func _unhandled_input(event):
	var direction_to_mouse = (get_viewport().get_mouse_position() - global_position).normalized()
	if event.is_action_released("attack"):
		owner.get_weapon().release_attack(Vector2.ZERO)
	pass
		
