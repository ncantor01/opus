extends character_behavior

@export var afraid_of: Array[StringName] = []
@export var detection_radius_multiplier = 2
@export var run_away_to_radius_multiplier = 2
var feared_objects = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _enter_tree():
	$Detection_area.scale.x *= detection_radius_multiplier
	$Detection_area.scale.y *= detection_radius_multiplier
	$Run_away_to_area.scale.x *= detection_radius_multiplier
	$Run_away_to_area.scale.y *= detection_radius_multiplier
	set_meta(&"behavior", ["movement"])
	pass

func _exit_tree():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.\

func move():
	var direction: Vector2 = Vector2.ZERO
	for i in feared_objects:
		direction = (direction + (global_position - i.global_position).normalized()).normalized()
	return direction

func _on_detection_area_body_entered(body):
	for i in afraid_of:
		if body.has_meta(i) and !feared_objects.has(body):
			feared_objects.append(body)
	pass # Replace with function body.


func _on_run_away_to_area_body_exited(body):
	#This will probably behave weirdly if we have multiple items
	#Which the character is afraid of chasing it at the same time
	for i in afraid_of:
		if body.has_meta(i):
			for j in range(feared_objects.size()):
				if feared_objects[j].has_meta(i):
					feared_objects.remove_at(j)
	pass # Replace with function body.
