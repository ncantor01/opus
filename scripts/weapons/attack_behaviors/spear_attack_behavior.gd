extends Node2D

func _enter_tree():
	assert(owner.has_meta(&"weapon"))
	owner.visible = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hold_attack(direction):
	owner.look_at(direction)
	owner.visible = true
	owner.enable_hitbox()
	pass

func release_attack(direction):
	owner.visible = false
	owner.disable_hitbox()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
