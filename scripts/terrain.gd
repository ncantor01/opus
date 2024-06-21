extends Node2D

@export var terrain_noise : NoiseTexture2D
@export var width = 512
@export var height = 512

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _get_height():
	return height

func _get_width():
	return width

