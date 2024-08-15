class_name Emittor extends Area2D

@export var type = "none"

func _enter_tree():
	collision_layer = 2
	set_meta(&"Type", type)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	collision_layer = 2
	pass # Replace with function body.

func is_sound():
	set_meta(&"Type", "sound")

func is_visual():
	set_meta(&"Type", "visual")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
