extends character_behavior

var dragged = null

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	set_meta(&"behavior", ["movement"])
	owner.get_collisionBox().disabled = true
	owner.set_meta(&"player", true)
	pass

func _exit_tree():
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("attack"):
		print("poop")
	pass

func move():
	var vertical_direction = Input.get_axis("up", "down")
	var horizontal_direction = Input.get_axis("left", "right")
	return (Vector2(horizontal_direction, vertical_direction).normalized())

func _unhandled_input(event):
	var direction_to_mouse = (get_viewport().get_mouse_position() - global_position).normalized()
	if event.is_action_released("attack"):
		print("poop")
	if event.is_action_pressed("interact"):
		interact_handler()
	if event.is_action_released("interact"):
		pass
	pass
		
func interact_handler():
	var interactables = owner.get_interactables()
	if interactables.values().has(&"BaitFish"):
		owner.set_state(5)
		bait_fish(interactables.find_key(&"BaitFish"))
	pass
	
func bait_fish(rod):
	owner.get_child(-1).show()

