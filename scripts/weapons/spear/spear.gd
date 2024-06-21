extends node2D

func _enter_tree():
	owner.$sprite.visible = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hold_attack(direction):
	look_at(direction)
	$sprite.visible = true
	pass

func release_attack(direction):
	$sprite.visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
