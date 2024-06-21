extends TileMap

#LAYERS
var ground_layer = 0

var width = 512
var height = 512
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_ground()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
		
func generate_ground():
	for x in range(-width/2, width/2):
		for y in range(-height/2, height/2):
			set_cell(ground_layer, Vector2(x,y), 0, Vector2i(rng.randi_range(0,1 ), 0), 0)
			
