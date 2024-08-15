extends character_behavior

var interactables = []
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
	if event.is_action_pressed("interact"):
		interact_handler()
	if event.is_action_released("interact"):
		print(dragged)
		if dragged != null:
			dragged.undrag()
			dragged = null
			owner.set_state(0)
	pass
		
func interact_handler():
	var interactable = null
	for i in interactables:
		if i.has_meta(&"interactable"):
			interactable = i
			break
	if interactable != null:
		for j in interactable.get_meta(&"interactable"):
			if j == &"draggable" and owner.get_held_item() == null:
				interactable.drag(owner)
				print(dragged)
				dragged = interactable
				owner.set_state(3)
	pass

func _on_interactable_area_body_entered(body):
	print("iteractable in area")
	interactables.append(body)
	pass # Replace with function body.


func _on_interactable_area_body_exited(body):
	for i in range(interactables.size()):
		if interactables[i] == body:
			interactables.remove_at(i)
	pass # Replace with function body.
