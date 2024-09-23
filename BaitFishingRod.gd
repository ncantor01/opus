extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interact_area_body_entered(body):
	if body.has_meta(&"player"):
		body.add_interactable(&"BaitFish", self)
	pass # Replace with function body.


func _on_interact_area_body_exited(body):
	body.remove_interactable(self)
	pass # Replace with function body.
