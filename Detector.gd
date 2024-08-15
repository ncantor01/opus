class_name Detector extends Node2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in get_children():
		if child is Sense:
			print(child.get_overlapping_areas())
			for j in child.get_overlapping_bodies():
				owner.detect(j)
	pass
