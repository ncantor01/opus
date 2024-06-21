extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_velocity():
	var velocity = Vector2.ZERO
	for i in get_children():
		assert(i.has_meta(&"behavior"), "All nodes in behavior should be behavior")
		if(i.get_meta(&"behavior").has("movement")):
			velocity = i.move().normalized()
			if velocity != Vector2.ZERO:
				break
	return velocity
