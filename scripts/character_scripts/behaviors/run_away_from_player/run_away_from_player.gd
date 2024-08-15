extends character_behavior

@export var afraid_of: Array[StringName] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _enter_tree():
	set_meta(&"behavior", ["movement"])
	pass

func _exit_tree():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.\

func move():
	var direction: Vector2 = Vector2.ZERO
	for i in owner.get_detected().values():
		for j in afraid_of:
			i.get_meta_list()
			if i.has_meta(j):
				direction = (direction + (global_position - i.global_position).normalized()).normalized()
	return direction
