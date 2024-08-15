extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_sight_area_entered(area):
	print(area)
	if area is Emittor:
		print("he do be emmittin doe")
		if area.has_meta(&"Type") and area.get_meta(&"Type") == "visual":
			owner.detect(area.owner)	
	pass # Replace with function body.


func _on_hearing_area_entered(area):
	if area is Emittor:
		if area.has_meta(&"Type") and area.get_meta(&"Type") == "sound":	
			owner.detect(area.owner)
	pass # Replace with function body.


func _on_smell_area_exited(area):
	if area is Emittor:
		owner.undetect(area.owner)
	pass # Replace with function body.

